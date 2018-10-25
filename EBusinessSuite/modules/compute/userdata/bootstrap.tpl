#cloud-config
timezone: "${timezone}"

packages:
  - rsync
  - nfs-utils
  - ntp
  - oracle-ebs-server-R12-preinstall

runcmd:
  - sudo mkdir -p ${src_mount_path}
  - sudo mount -t nfs -o rw,bg,hard,timeo=600,nfsvers=3,tcp ${src_mount_target_private_ip}:${src_export_path} ${src_mount_path}
  - sudo chown oracle:oinstall ${src_mount_path}
  - echo ${src_mount_target_private_ip}:${src_export_path} ${src_mount_path} nfs rw,bg,hard,timeo=600,nfsvers=3 0 0 >> /etc/fstab
  # Run firewall command to enable to open ports
  - firewall-offline-cmd --port=${app_instance_listen_port}:tcp
  - /bin/systemctl restart firewalld
