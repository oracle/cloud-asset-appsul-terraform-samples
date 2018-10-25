#/bin/bash
sudo mkdir -p ${fss_mount_path}
sudo mount ${fss_mount_target_private_ip}:${fss_export_path} ${fss_mount_path}
echo '${fss_mount_target_private_ip}:${fss_export_path} ${fss_mount_path} nfs tcp,vers=3' | sudo tee -a /etc/fstab
touch /tmp/fss.mounted