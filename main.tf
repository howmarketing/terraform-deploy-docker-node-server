provider "docker" { }

resource "docker_image" "node_app" {
  name         = "myblenet/node-sample-server:1.0"  # Use the custom image name and tag
  # build {
  #   context    = "./node-app"  # Directory where your Dockerfile is located
  #   dockerfile = "Dockerfile"
  # }
  keep_locally = false
}

resource "docker_container" "node_app" {
  image = docker_image.node_app.image_id
  name  = "node_container"
  
  # map the container port to the host machine port
  ports {
    internal = 3000 # container port
    external = 80 # host machine port
  }

  # command = ["npm", "run", "dev"]

  # Add environment variables or volume mounts if needed
  # e.g., environment = ["NODE_ENV=production"]
  #       volumes = ["./app:/usr/src/app"]
}

# Define an output to retrieve the container IP address, and others data like: bridge, command, container_logs, entrypoint, env, exit_code, hostname, id, init, ipc_mode, log_driver, network_data, runtime, security_opts, shm_size, healthcheck, labels
output "container_id" {
  value  = docker_container.node_app.id
}
output "container_ports" {
  value  = docker_container.node_app.ports
}
output "bridge_network" {
  value = docker_container.node_app.bridge
}
output "environments_variables" {
  value  = docker_container.node_app.env
}
output "command" {
  value  = docker_container.node_app.command
}
output "cpu_set" {
  value  = docker_container.node_app.cpu_set
}
output "cpu_shares" {
  value  = docker_container.node_app.cpu_shares
}
output "entrypoint" {
  value  = docker_container.node_app.entrypoint
}
output "container_logs" {
  value  = docker_container.node_app.container_logs
}