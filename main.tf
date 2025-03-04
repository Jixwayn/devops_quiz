terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" { 
  host = "npipe:////./pipe/docker_engine"  # ใช้สำหรับ Windows
}

resource "docker_image" "node_app" {
  name         = "my-node-app"
  keep_locally = true
  build {
    context    = "./"             # ใช้เส้นทางที่ถูกต้อง
    dockerfile = "Dockerfile"     # ตรวจสอบว่า Dockerfile มีชื่อและตำแหน่งที่ถูกต้อง
    no_cache   = true  # ปิดการใช้ Docker Build Cache

  }
}

resource "docker_container" "node_container" {
  name  = "my-node-container"
  image = docker_image.node_app.image_id  # ใช้ image_id แทน name
  ports {
    internal = 3000
    external = 3000
  }
  env = [ "NODE_ENV=production" ]
}
