package main

import "core:fmt"

perform :: proc(args: ..string) {
    fmt.println("me", "performs", ..args)
}

// switch_user :: proc(user: string, action: (args: Args) -> (), args: $Args) {
//     context.user = user
//     action(args)
// }

main :: proc() {
    perform("something")
    // switch_user("them", perform, cast([]string) .["something", "else"])
    // perform("again")
}
