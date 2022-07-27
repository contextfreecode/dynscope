type HasLength = { length: number };

type WithModeRequest<Result> = {
  request: Request;
  mode: string;
  action: (request: Request) => Result;
};

function reallyPerform<Task extends HasLength>(
  request: Request,
  task: Task,
): number {
  const mode = request.headers.get("mode");
  console.log(`${mode}: ${task}`);
  return task.length;
}

function perform<Task extends HasLength>(
  request: Request,
  task: Task,
): number {
  return reallyPerform(request, task);
}

function withMode<Result>(request: WithModeRequest<Result>): Result {
  const next = request.request.clone();
  next.headers.set("mode", request.mode);
  return request.action(next);
}

export default {
  port: 3000,
  fetch(request: Request) {
    request.headers.set("mode", "safe");
    return new Response([
      perform(request, "something"),
      withMode({
        request,
        mode: "faster",
        action: (request) => perform(request, "reliable"),
      }),
      perform(request, ["again"]),
    ].join(" "));
  },
};
