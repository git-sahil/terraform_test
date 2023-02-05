terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.47.0"
    }
  }
  required_version = ">= 1.3.3"
  backend "local" {
    path = "terraform.tfstate"
  }
}

resource "google_pubsub_topic" "example" {
  count = 10000

  name = "topic-${count.index}"
}

output "topic_names" {
  value = google_pubsub_topic.example.*.name
}
