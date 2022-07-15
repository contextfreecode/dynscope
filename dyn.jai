#import "Basic";
#import "String";

#add_context user := "safe";

perform_really :: (task: string) {
    print("%: %\n", context.user, task);
}

perform :: (task: string) {
    perform_really(task);
}

with_mode :: (user: string, action: (args: $Args) -> (), args: Args) {
    new_context := context;
    push_context new_context {
        context.user = user;
        action(args);
    }
}

main :: () {
    perform("something");
    with_mode("faster", perform, "reliable");
    perform("again");
}
