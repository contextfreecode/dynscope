const user = "me";

class Request {
  mode: string;

  reallyPerform(task: string): void {
    console.log(`${this.mode}: ${task}`);
  }

  perform(task: string): void {
    this.reallyPerform(task);
  }
}

export function main() {
  const request = Object.assign(new Request(), { mode: "safe" });
  request.perform("something");
  const fasterRequest = Object.assign(new Request(), { mode: "faster" });
  fasterRequest.perform("reliable");
  request.perform("again");
}

main();
