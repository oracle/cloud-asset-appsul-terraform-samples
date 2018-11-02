#cloud-config
timezone: "${timezone}"

packages:
- nfs-utils
- oracle-rdbms-server-12cR1-preinstall.x86_64
- glibc.i686
- libstdc++.i686
- firefox.x86_64
- nc
- samba

runcmd:
- mkdir -p ${fss_mount_path}
- sudo mount ${fss_mount_target_private_ip}:${fss_export_path} ${fss_mount_path}
- echo '${fss_mount_target_private_ip}:${fss_export_path} ${fss_mount_path} nfs tcp,vers=3' | sudo tee -a /etc/fstab
- mount -a -t nfs