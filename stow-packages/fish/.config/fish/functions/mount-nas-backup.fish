function mount-nas-backup --description "Mount backup NAS to /mnt/nas-backup"
    if mountpoint -q /mnt/nas-backup
        echo "✓ NAS bereits gemountet"
        return 0
    end

    echo "Mounte Backup-NAS..."
    sudo mount -t cifs "//$NAS_BACKUP_HOST/$NAS_BACKUP_SHARE" /mnt/nas-backup -o credentials=/home/mathias/.smbcredentials-backup,uid=mathias,gid=mathias,file_mode=0755,dir_mode=0755

    if test $status -eq 0
        echo "✓ NAS erfolgreich gemountet"
    else
        echo "✗ Fehler beim Mounten"
        return 1
    end
end
