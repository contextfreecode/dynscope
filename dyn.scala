// https://scastie.scala-lang.org/nD6CaZNxRMiDfD59MD3fAw

case class Env(
  mode: String,
)

given Env = Env(mode = "safe")

def reallyPerform(task: String)(using env: Env) =
  println(s"${env.mode}: $task")

def perform(task: String)(using env: Env) =
  reallyPerform(task)

// def withMode[T](mode: String)(action: (env: Env) ?=> T)(using env: Env) =
//   given Env = env.copy(mode = mode)
//   action

def withMode[T](mode: String)(action: Env ?=> T) =
  (env: Env) ?=> action(using env.copy(mode = mode))

@main def main() =
  perform("something")
  withMode("faster") { perform("reliable") }
  perform("again")
end main
