#import "Basic";
#import "String";

#add_context user := "me";

perform :: (args: ..string) {
    print("% performs %\n", context.user, join(..args, " "));
}

switch_user :: (user: string, action: (args: Args) -> (), args: $Args) {
    new_context := context;
    push_context new_context {
        context.user = user;
        action(args);
    }
}

main :: () {
    perform("something");
    switch_user("them", perform, cast([]string) .["something", "else"]);
    perform("again");
}
