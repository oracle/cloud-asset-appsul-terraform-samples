#Copyright © 2018, Oracle and/or its affiliates. All rights reserved.

#The Universal Permissive License (UPL), Version 1.0


### Authentication details
$env:TF_VAR_tenancy_ocid="<tenancy OCID>"
$env:TF_VAR_user_ocid="<user OCID>"
$env:TF_VAR_fingerprint="<PEM key fingerprint>"
$env:TF_VAR_private_key_path="<path to the private key that matches the fingerprint above>"

### Region
$env:TF_VAR_region="<region in which to operate, example: us-ashburn-1, us-phoenix-1>"

### Compartment
$env:TF_VAR_compartment_ocid="<compartment OCID>"

### Public/private keys used on the instance
$env:TF_VAR_ssh_public_key="<path to public key>"
$env:TF_VAR_ssh_private_key="<path to private key>"

### Public/private keys used on the bastion instance
$env:TF_VAR_bastion_ssh_public_key="<path to bastion public key>"
$env:TF_VAR_bastion_ssh_private_key="<path to bastion private key>"
