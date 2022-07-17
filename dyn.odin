package main

import "core:fmt"

Env :: struct {
    mode: string,
}

really_perform :: proc(task: $Task) -> int {
    env := (cast(^Env)context.user_ptr)^
    fmt.printf("%s: %s\n", env.mode, task)
    return len(task)
}

perform_array :: proc(task: []string) -> int {
    return really_perform(task)
}

perform_string :: proc(task: string) -> int {
    return really_perform(task)
}

perform :: proc{perform_array, perform_string};

with_mode :: proc(
    mode: string, action: proc(args: $Args) -> $Result, args: Args,
) -> Result {
    env := (cast(^Env)context.user_ptr)^
    env.mode = mode
    context.user_ptr = &env
    return action(args)
}

main :: proc() {
    context.user_ptr = &Env{mode="safe"}
    fmt.println(
        perform("something"),
        with_mode("faster", perform_string, "reliable"),
        perform([]string{"again"}),
    )
}
