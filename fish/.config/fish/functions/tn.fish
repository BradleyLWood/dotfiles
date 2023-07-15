function tn
    tmux new -s $argv || tmux new -s $argv -d
end
