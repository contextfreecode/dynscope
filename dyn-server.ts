type SwitchUserRequest<T> = {
  request: Request;
  user: string;
  action: (request: Request) => T;
};

function perform(request: Request, ...task: string[]): string {
  const user = request.headers.get("user");
  return `${user} performs ${task.join(" ")}`;
}

function switchUser<T>(request: SwitchUserRequest<T>): T {
  const next = request.request.clone();
  next.headers.set("user", request.user);
  return request.action(next);
}

export default {
  port: 3000,
  fetch(request: Request) {
    // Pretend the request comes with this header.
    request.headers.set("user", "me");
    const result = [] as string[];
    // Gather up each section.
    result.push(perform(request, "something"));
    result.push(
      switchUser({
        request,
        user: "them",
        action: (request) => perform(request, "something", "else"),
      }),
    );
    result.push(perform(request, "again"));
    // Done.
    return new Response(result.join("\n"));
  },
};
