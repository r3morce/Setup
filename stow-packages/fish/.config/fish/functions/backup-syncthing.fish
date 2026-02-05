function backup-syncthing --description "Backup Syncthing config to NAS"
    set -l target /mnt/nas-backup/linux-backup/cachyos/Syncthing

    # Prüfe ob bereits gemountet
    if not mountpoint -q /mnt/nas-backup
        echo "Mounte Backup-NAS..."
        sudo mount -t cifs //nas-backup.local/home /mnt/nas-backup -o credentials=/home/mathias/.smbcredentials-backup,uid=mathias,gid=mathias,file_mode=0755,dir_mode=0755

        if test $status -ne 0
            echo "✗ Fehler beim Mounten"
            return 1
        end
        set -l mounted_by_us true
    else
        echo "✓ NAS bereits gemountet"
        set -l mounted_by_us false
    end

    echo "Kopiere Syncthing-Config..."
    mkdir -p $target
    cp ~/.local/state/syncthing/config.xml $target/
    cp ~/.local/state/syncthing/cert.pem $target/
    cp ~/.local/state/syncthing/key.pem $target/

    echo "✓ Backup abgeschlossen:"
    ls -lh $target/config.xml $target/cert.pem $target/key.pem

    # Nur unmounten wenn wir gemountet haben
    if test "$mounted_by_us" = true
        echo "Unmounte NAS..."
        sudo umount /mnt/nas-backup
    end
end
