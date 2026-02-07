function mount-nas-media --description "Mount media NAS to /mnt/nas-media"
    if mountpoint -q /mnt/nas-media
        echo "✓ NAS bereits gemountet"
        return 0
    end

    echo "Mounte Media-NAS..."
    sudo mount -t cifs "//$NAS_MEDIA_HOST/$NAS_MEDIA_SHARE" /mnt/nas-media -o credentials=/home/mathias/.smbcredentials-media,uid=mathias,gid=mathias,file_mode=0755,dir_mode=0755

    if test $status -eq 0
        echo "✓ NAS erfolgreich gemountet"
    else
        echo "✗ Fehler beim Mounten"
        return 1
    end
end
