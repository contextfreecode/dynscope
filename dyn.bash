mode="safe"

really-perform() {
    echo $mode: $1 >&2
    echo ${#1}
}

perform() {
    (really-perform $1)
}

with-mode() {
    mode="$1"
    "${@:2}"
}

main() {
    echo \
        $(perform something) \
        $(with-mode faster perform reliable) \
        $(perform again)
}

main
