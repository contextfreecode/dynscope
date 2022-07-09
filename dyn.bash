user="me"

do-something() {
    echo $user
}

nested() {
    (do-something)
}

switch-user-nested() {
    user="them"
    (do-something)
}

(nested)
(switch-user-nested)
(nested)
