output "container_id" {
  value = docker_container.node_container.id
}

output "app_url" {
  value = "http://localhost:3000"
}
