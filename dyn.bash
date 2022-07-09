user="me"

perform() {
    echo $user performs $@
}

switch-user() {
    user="$1"
    ("${@:2}")
}

(perform something)
(switch-user them perform something else)
(perform again)
