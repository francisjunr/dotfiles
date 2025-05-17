hyprlock
sleep 30
# Check if i3lock is running
if pgrep -x "hyprlock" > /dev/null; then
    echo "Screen is locked."
		systemctl suspend
else
    echo "Not suspending: screen is not locked"
fi
