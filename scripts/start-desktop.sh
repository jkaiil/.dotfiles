# Setter opp wallpaper directory
wall_dir="$HOME/.dotfiles/wallpaper"

# Starter swww om den ikke gjør det enda.
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 1  # Venter pent på at den er ferdig.
fi

killall waybar
# Velger tilfeldig bilde fra mappe variabel
wall=$(find "$wall_dir" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Setter wallpaper med smooth transition
swww img "$wall" --transition-fps 60 --transition-step 255 --transition-type any --transition-duration 1

sleep 1
# oppdaterer pywal16 farger!
wal -i "$wall"

sleep 1
# Refresher waybar tilslutt :)
waybar & disown