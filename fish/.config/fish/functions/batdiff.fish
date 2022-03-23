batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
