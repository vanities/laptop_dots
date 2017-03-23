#exec i3
redshift -l 35.845621:-86.390270 &
#~/.config/bar.sh | lemonbar -p -f "Inconsolata:pixelsize=12:antialias=true:hinting=true" &
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &
feh --randomize --bg-fill ~/Downloads/pics/* &

exec bspwm

