mode="safe"

really-perform() {
    echo $mode: $1
}

perform() {
    (really-perform $1)
}

switch-mode() {
    mode="$1"
    ("${@:2}")
}

(perform something)
(switch-mode faster perform reliable)
(perform again)
