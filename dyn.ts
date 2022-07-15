const mode = "safe";

type WithModeRequest<T> = {
  mode: string;
  action: () => T;
};

function reallyPerform(task: string): void {
  console.log(`${mode}: ${task}`);
}

function perform(task: string): void {
  reallyPerform(task);
}

function withMode<T>(request: WithModeRequest<T>): T {
  // TODO try/finally global change!
  const mode = request.mode;
  return request.action();
}

export function main() {
  perform("something");
  withMode({
    mode: "faster",
    action: () => {
      perform("reliable");
    },
  });
  perform("again");
}

main();
