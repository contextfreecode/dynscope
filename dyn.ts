const mode = "safe";

type WithModeRequest<T> = {
  mode: string;
  action: () => T;
};

type HasLength = { length: number };

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
  let result = perform("something");
  result += withMode({
    mode: "faster",
    action: () => {
      return perform("reliable");
    },
  });
  result += perform(["again"]);
  console.log(`result: ${result}`)
}

main();
