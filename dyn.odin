package main

import "core:fmt"

Env :: struct {
    mode: string,
}

really_perform :: proc(task: string) {
    env := (cast(^Env)context.user_ptr)^
    fmt.printf("%s: %s\n", env.mode, task)
}

perform :: proc(task: string) {
    really_perform(task)
}

with_mode :: proc(mode: string, action: proc(args: $Args) -> (), args: Args) {
    env := (cast(^Env)context.user_ptr)^
    env.mode = mode
    context.user_ptr = &env
    action(args)
}

main :: proc() {
    context.user_ptr = &Env{mode="safe"}
    perform("something")
    with_mode("faster", perform, "reliable")
    perform("again")
}
