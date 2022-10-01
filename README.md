# dotfiles
*AKA how to klep the look and feel of my terminal*

![2022-09-29-144102_842x690_scrot](https://user-images.githubusercontent.com/26313286/193116177-e1b93aeb-adcc-43f2-8bf5-3537c552ec08.png)

Alacritty + ZSH + Syntax Highlighting + Powerlevel10k

Segments: exit status, background jobs, context, working directory, git branch & status

#### Features:
- high-contrast color scheme
- bracket-enclosed segment style
- doesn't require special powerline fonts
- read only directories are grayed out in powerline
- prompt char uses exit code of previous command as color
- segments only show when relevant; working directory is the only permanent segment

---

#### Bonus:
My BASH prompt!

`PS1='$(x=$?; [[ $x -gt 0 ]] && echo "\[\033[31;1m\]$x ")$([[ \j -gt 0 ]] && echo "\[\033[33;1m\]&\j ")$([[$SSH_CLIENT ]] && echo "\[\033[32;1m\]\u\[\033[0m\]@\[\033[36;1m\]\h ")\[\033[3$([[ -w $(pwd) ]] && echo 4 ||echo 0);1m\]$([[ ! -e .git ]] && echo "\w" || echo "\W \[\033[35;1m\]$(git branch --show-current)\[\033[31;1m\]$(git status --porcelain|cut -b 2|uniq|tr -d [:space:]|tr M !|sed s/.$/\\\0\/)")\[\033[30;1m\]>\[\033[0m\] '`

Which looks like this `~>` and displays nearly all the same info as the powerline when relevant, including git!

For the basic version with only the path and prompt char, use this:

`PS1='\[\033[3$([[ -w $(pwd) ]] && echo 4 || echo 0);1m\]\w\[\033[30;1m\]>\[\033[0m\] '`
