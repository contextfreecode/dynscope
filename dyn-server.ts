type WithModeRequest<T> = {
  request: Request;
  mode: string;
  action: (request: Request) => T;
};

function reallyPerform(request: Request, task: string): string {
  const mode = request.headers.get("mode");
  return `${mode}: ${task}`;
}

function perform(request: Request, task: string): string {
  return reallyPerform(request, task);
}

function switchUser<Result>(request: WithModeRequest<Result>): Result {
  const next = request.request.clone();
  next.headers.set("mode", request.mode);
  return request.action(next);
}

export default {
  port: 3000,
  fetch(request: Request) {
    request.headers.set("mode", "safe");
    const result = [] as string[];
    // Gather up each section.
    result.push(perform(request, "something"));
    result.push(
      switchUser({
        request,
        mode: "faster",
        action: (request) => perform(request, "reliable"),
      }),
    );
    result.push(perform(request, "again"));
    // Done.
    return new Response(result.join("\n"));
  },
};
