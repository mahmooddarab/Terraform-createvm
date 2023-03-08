terraform {
  required_providers {
    vsphere={
        version = "1.15.0" 
        
    }
  }
  
}

provider "vsphere" {
    user = "root"
    password = "PASS"
    vsphere_server = "IP_ESX"
    allow_unverified_ssl = true
    

} 

resource "vsphere_virtual_machine" "vm" {
    name = "vm1"
    resource_pool_id = "ha-root-pool"
    datastore_id = "63fc906d-d24b0493-ff7a-000c2975c908"
    num_cpus = 1
    memory = 1024
    guest_id = "other3xlinux64Guest"
    wait_for_guest_net_timeout = 0
    wait_for_guest_ip_timeout = 0

    network_interface {
      network_id = "HaNetwork-VM Network"

    }

    disk {
      label = "disk0"
      size = 10
    }
  
}