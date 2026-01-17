function umiso
    if test (count $argv) -eq 0
        echo "Verwendung: umiso /mnt/isoname ODER umiso isoname"
        return 1
    end

    set mount_point $argv[1]

    # Falls nur Name ohne /mnt/ angegeben
    if not string match -q '/mnt/*' $mount_point
        set mount_point /mnt/$mount_point
    end

    sudo umount $mount_point

    if test $status -eq 0
        echo "ISO unmountet: $mount_point"
        sudo rmdir $mount_point 2>/dev/null
    end
end
