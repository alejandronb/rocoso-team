terraform {
  backend "gcs" {
    bucket  = "rocoso-terraform-state"
    prefix  = "terraform/state"
    credentials = "account.json"
  }
}