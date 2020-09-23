#youtube stuff
yta() {
	mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
}
ytv() {
	mpv ytdl://ytsearch:"$*" 2&>/dev/null & disown
}
