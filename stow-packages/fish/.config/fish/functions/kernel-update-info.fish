function ku
    grep "upgraded linux-cachyos (" /var/log/pacman.log | sed 's/\[//g' | sed 's/\]//g' | awk '{print $1, $2, ":", $5, "→", $7}'
end
