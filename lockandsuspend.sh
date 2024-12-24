i3lock --color 000000
sleep 30
# Check if i3lock is running
if pgrep -x "i3lock" > /dev/null; then
    echo "Screen is locked."
		systemctl suspend
else
    echo "Not suspending: screen is not locked"
fi
