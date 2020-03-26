func! ListMap()
    let l:result = ''
    redir => l:result
    silent map
    redir end

    return l:result
endfunc!

func! FzfListMap()
    let l:map = ListMap()
    python <<PY
import vim
import subprocess

map = vim.eval('l:map')
process = subprocess.Popen(["fzf-tmux"], stdin=subprocess.PIPE, stderr=subprocess.PIPE)
process.stdin.write(map)
process.stdin.close()
PY
endfunc!
