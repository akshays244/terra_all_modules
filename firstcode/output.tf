output "public_ip_address" {
    value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip 
    description = "the public ip of the server"


  
}