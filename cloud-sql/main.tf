resource "google_sql_database_instance" "sqlinstance" {

    name = "main-instance"
    database_version = "POSTGRES_15"
    region = "us-central1"
    deletion_protection = false

    settings {
      tier = "db-f1-micro"
      location_preference {
        zone = "us-central1-a"
      }
    }
  
}