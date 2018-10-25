#Copyright © 2018, Oracle and/or its affiliates. All rights reserved.

#The Universal Permissive License (UPL), Version 1.0


#/bin/bash
sudo mkdir -p ${dst_mount_path}
sudo mount -t nfs -o rw,bg,hard,timeo=600,nfsvers=3,tcp ${dst_mount_target_private_ip}:${dst_export_path} ${dst_mount_path}
sudo chown oracle:oinstall ${dst_mount_path}
echo '${dst_mount_target_private_ip}:${dst_export_path} ${dst_mount_path} nfs rw,bg,hard,timeo=600,nfsvers=3 0 0' | sudo tee -a /etc/fstab
echo '#${fss_sync_frequency} /usr/bin/flock -n /var/run/fss-sync-up-file-system.lck rsync -aHAXxv --numeric-ids --delete ${src_mount_path} ${dst_mount_path}' | sudo tee -a /etc/cron.d/fss-sync-up-file-system
sudo crontab /etc/cron.d/fss-sync-up-file-system
touch /tmp/rsync.done