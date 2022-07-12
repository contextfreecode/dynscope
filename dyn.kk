effect env
  val mode: string

fun really-perform(task): <console, env> ()
  println(mode ++ " perform " ++ task)

fun perform(task): <console, env> ()
  really-perform(task)

fun with-mode(
  new-mode: string,
  action: () -> <console, env> ()
): <console, env> ()
  with val mode = new-mode
  action()

fun main(): <console> ()
  with val mode = "safe"
  perform("something")
  with-mode("faster")
    perform("reliable")
  perform("again")
