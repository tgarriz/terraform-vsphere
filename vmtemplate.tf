# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "juan.garriz"
  password       = "${var.pass}"
  vsphere_server = "vcenter508.arba.gov.ar" 

  # if you have a self-signed cert
  allow_unverified_ssl = true
}


# Deploy 2 linux VMs
module "server-linuxvm" {
  source        = "Terraform-VMWare-Modules/vm/vsphere"
  version       = "3.5.0"
  vmtemp        = "ubuntu-Bionic-18.04.4-Template-64-PAM-LVM"
  instances     = 1
  vmname        = "webroomp"
  cpu_number    = 8
  ram_size      = 16392
  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
  memory_hot_add_enabled = true
  vmrp          = "ClusterNSX/Resources"
  network = {
    "P-3004-DNSExternos" = ["170.155.17.152"] # To use DHCP create Empty list ["",""]
  }
  data_disk = {
    disk1 = {
      size_gb                   = 600,
      thin_provisioned          = true,
      data_disk_scsi_controller = 0
    },
  }
  ipv4submask  = ["25"]
  vmgateway = "170.155.17.254"
  dc        = "ARBA508"
  datastore_cluster = "Datastores-EMC"
  dns_server_list  = ["170.155.17.129", "170.155.17.130"]
  domain = "arba.gov.ar"
  
}
