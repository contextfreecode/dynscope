effect env
  val mode: string

fun really-perform(task): <console, env> ()
  println(mode ++ " perform " ++ task)

fun perform(task): <console, env> ()
  really-perform(task)

// TODO Why not this?
// fun with-mode(new-mode: string, action: () -> <|e> a): <env|e> a
fun with-mode(new-mode: string, action: () -> <env|e> a): <|e> a
  with val mode = new-mode
  action()

fun main(): <console> ()
  with val mode = "safe"
  perform("something")
  with-mode("faster")
    perform("reliable")
  perform("again")
