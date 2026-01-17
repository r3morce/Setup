function miso
    if test (count $argv) -eq 0
        echo "Verwendung: miso /pfad/zur/datei.iso"
        return 1
    end

    set iso_file $argv[1]
    set iso_name (basename $iso_file .iso)
    set mount_point /mnt/$iso_name

    # Mount-Point erstellen falls nicht vorhanden
    sudo mkdir -p $mount_point

    # ISO mounten
    sudo mount -o loop $iso_file $mount_point

    if test $status -eq 0
        echo "ISO gemountet unter: $mount_point"
    end
end
