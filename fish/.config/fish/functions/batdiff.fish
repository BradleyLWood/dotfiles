function batdiff
    cd ..
    git diff --name-only --diff-filter=d | xargs bat --diff
    cd -
end
