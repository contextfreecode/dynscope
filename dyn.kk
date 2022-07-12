effect env
  val mode: string

fun perform(): <console, env> ()
  println(mode ++ " perform")

fun main(): <console> ()
  with val mode = "safe"
  perform()
  with val mode = "fast"
  perform()
