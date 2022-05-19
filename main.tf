# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = var.proveedor["user"]
  password       = var.proveedor["pass"]
  vsphere_server = var.proveedor["server"]

  # if you have a self-signed cert
  allow_unverified_ssl = true
}


# Deploy 2 linux VMs
module "server-linuxvm" {
  source        = "Terraform-VMWare-Modules/vm/vsphere"
  version       = "3.5.0"
  vmtemp        = "ubuntu-Bionic-18.04.4-Template-64-PAM-LVM"
  instances     = 1
  vmname        = "nbkpepe"
  cpu_number    = 2
  ram_size      = 2048
  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
  memory_hot_add_enabled = true
  vmrp          = "ClusterNSX/Resources"
  network = {
    "P-3004-DNSExternos" = ["10.16.44.221"] # To use DHCP create Empty list ["",""]
  }
  /*data_disk = {
    disk1 = {
      size_gb                   = 600,
      thin_provisioned          = true,
      data_disk_scsi_controller = 0
    },
  }*/
  ipv4submask  = ["24"]
  vmgateway = "10.16.44.254"
  dc        = "ARBA508"
  datastore_cluster = "Datastores-EMC"
  dns_server_list  = ["10.16.6.1", "10.16.6.2"]
  domain = "test.arba.gov.ar"
  
}
