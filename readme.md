# Use a Bash script in your vm's first boot

When deploying a virtual machine in Azure or Google Cloud, you may need to install, update or change something  
in the first boot.  
Terraform is not an ideal tool for this job and if you try local or remote exec, you will find it slow.

Cloud-init is the industry standard multi-distribution method for cross-platform cloud instance initialization.  
It is supported across all major public cloud providers, provisioning systems for private cloud infrastructure, and bare-metal installations.  
<https://cloudinit.readthedocs.io/en/latest/>

## How to

- Install Azure CLI, Google gcloud sdk and Terraform
- Login to your Azure and Google Cloud subscriptions
- From inside azure folder: `terraform init` --> `terraform apply`
- From inside gcp folder: `terraform init` --> `terraform apply`

Both vms will start with Rancher's K3s installed, as described in the scripts/cloud-init.sh

If you only need one line of code:

> azure --> compute.tf line:30 --> custom_data = base64encode(file("../scripts/cloud-init.sh"))  
> gcp --> compute.tf line:25 --> metadata_startup_script = file("../scripts/cloud-init.sh")
