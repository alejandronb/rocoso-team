provider "google" {
  credentials = file("account.json")
  project     = "rocoso-project"
  region      = "europe-west2"
}