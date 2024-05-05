data "google_iam_policy" "admin" {
  binding {
    role = "roles/iam.serviceAccountUser"

    members = [
      "user:akshaysharmaitm@gmail.com",
    ]
  }
}

resource "google_service_account" "sa" {
  account_id   = "my-service-account"
  display_name = "A service account that only akshay can interact with"
}

resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  policy_data        = data.google_iam_policy.admin.policy_data
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}

resource "google_compute_instance" "defaultVM" {
    name = "vm1"
    machine_type = "n2-standard-2"
    zone = "us-central1-a"

    tags = ["foofoo" , "booboo"]


    boot_disk {
      initialize_params {
        
        image = "debian-cloud/debian-11"
        labels = {my_lables="test"}
      }

    }
    scratch_disk {
      
      interface = "NVME"
    }

    network_interface {
      network = "default"

    }
metadata = {foo="bar"}

metadata_startup_script = "echo hi > /test.txt"

  
}

