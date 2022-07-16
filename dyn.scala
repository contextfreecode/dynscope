// https://scastie.scala-lang.org/nD6CaZNxRMiDfD59MD3fAw

case class Env(
  mode: String,
)

given Env = Env(mode = "safe")

def reallyPerform[Task <: Seq[?]](task: Task)(using env: Env) =
  println(s"${env.mode}: $task")
  task.length

def perform[Task <: Seq[?]](task: Task)(using env: Env) =
  reallyPerform(task)

// def withMode[R](mode: String)(action: (env: Env) ?=> R)(using env: Env) =
//   given Env = env.copy(mode = mode)
//   action

def withMode[Result](mode: String)(action: Env ?=> Result) =
  (env: Env) ?=> action(using env.copy(mode = mode))

@main def main() =
  var result = perform("something")
  result += withMode("faster") { perform("reliable") }
  result += perform(List("again"))
  println(s"result: $result")
end main
