const user = "me";

class Request {
  user: string;
  perform(...task: string[]): void {
    console.log(`${this.user} performs ${task.join(" ")}`);
  }
}

export function main() {
  const request = Object.assign(new Request(), { user: "me" });
  request.perform("something");
  const themRequest = Object.assign(new Request(), { user: "them" });
  themRequest.perform("something", "else");
  request.perform("again");
}

main();
