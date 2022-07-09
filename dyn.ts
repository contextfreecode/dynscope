const user = "me";

type SwitchUserRequest<T> = {
  user: string;
  action: () => T;
};

function perform(...task: string[]): void {
  console.log(`${user} performs ${task.join(" ")}`);
}

function switchUser<T>(request: SwitchUserRequest<T>): T {
  const user = request.user;
  return request.action();
}

export function main() {
  perform("something");
  switchUser({
    user: "them",
    action: () => {
      perform("something", "else");
    },
  });
  perform("again");
}

main();
