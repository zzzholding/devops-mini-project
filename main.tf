terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "devops_app" {
  name = "devops-mini-project:latest"
}

resource "docker_container" "devops_app" {
  name  = "devops-terraform-container"
  image = docker_image.devops_app.image_id

  ports {
    internal = 5000
    external = 5001
  }
}