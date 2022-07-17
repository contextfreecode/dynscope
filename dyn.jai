#import "Basic";
#import "String";

#add_context user := "safe";

perform_really :: (task: $Task) -> s64 {
    print("%: %\n", context.user, task);
    return task.count;
}

perform :: (task: string) -> s64 {
    return perform_really(task);
}

perform :: (task: []string) -> s64 {
    return perform_really(task);
}

with_mode :: (
    user: string, action: (args: $Args) -> $Result, args: Args
) -> Result {
    new_context := context;
    push_context new_context {
        context.user = user;
        return action(args);
    }
}

main :: () {
    print(
        "% % %\n",
        perform("something"),
        with_mode("faster", perform, "reliable"),
        perform(.["again"]),
    );
}
