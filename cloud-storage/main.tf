resource "google_storage_bucket" "chillpill" {
    name = random_string.random.id
    location = "US"
    force_destroy = true

}

resource "random_string" "random" {
    length = 14
    special = false
    override_special = "/akki"
    upper = false
  
}