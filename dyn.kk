effect env
  val mode: string

fun count(items: list<a>): int
  items.length

fun really-perform(task: list<string>): <console, env> int
  println(mode ++ ": " ++ task.show)
  task.count

fun really-perform(task: string): <console, env> int
  println(mode ++ ": " ++ task.show)
  task.count

fun perform(task: list<string>): <console, env> int
  really-perform(task)

fun perform(task: string): <console, env> int
  really-perform(task)

// TODO Why not this?
// fun with-mode(new-mode: string, action: () -> <|e> a): <env|e> a
fun with-mode(new-mode: string, action: () -> <env|e> a): <|e> a
  with val mode = new-mode
  action()

fun main(): console ()
  with val mode = "safe"
  var result := perform("something")
  result := result + with-mode("faster")
    perform("reliable")
  result := result + perform(["again"])
  println("result: " ++ result.show)
