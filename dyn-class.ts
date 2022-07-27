type HasLength = { length: number };

class Request<Task extends HasLength> {
  mode: string;

  reallyPerform(task: Task): number {
    console.log(`${this.mode}: ${task}`);
    return task.length;
  }

  perform(task: Task): number {
    return this.reallyPerform(task);
  }
}

export function main() {
  const request = Object.assign(new Request<String>(), { mode: "safe" });
  const fasterRequest = Object.assign(new Request<String>(), {
    mode: "faster",
  });
  const arrayRequest = Object.assign(new Request<String[]>(), {
    mode: request.mode,
  });
  console.log(
    request.perform("something"),
    fasterRequest.perform("reliable"),
    arrayRequest.perform(["again"]),
  );
}

main();
