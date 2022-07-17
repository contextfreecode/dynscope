const mode = "safe";

type HasLength = { length: number };

type WithModeRequest<T> = {
  mode: string;
  action: () => T;
};

function reallyPerform<Task extends HasLength>(task: Task): number {
  console.log(`${mode}: ${task}`);
  return task.length;
}

function perform<Task extends HasLength>(task: Task): number {
  return reallyPerform(task);
}

function withMode<Result>(request: WithModeRequest<Result>): Result {
  // TODO try/finally global change!
  const mode = request.mode;
  return request.action();
}

export function main() {
  console.log(
    perform("something"),
    withMode({ mode: "faster", action: () => perform("reliable") }),
    perform(["again"]),
  );
}

main();
