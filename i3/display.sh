function isConnected() {
	! xrandr | grep HDMI1 | grep disconnected
}
function isActive() {
	xrandr --listactivemonitors | grep HDMI1
}
while true
do
	if isConnected && ! isActive; then
		xrandr --output eDP1 --pos 0x256 --output HDMI1 --pos 1366x0 --mode 1920x1080
		$HOME/.config/polybar/launch.sh
	fi
	if ! isConnected && isActive; then
		xrandr --output HDMI1 --off
		$HOME/.config/polybar/launch.sh
	fi
done

