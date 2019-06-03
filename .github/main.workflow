workflow "Build and Push" {
  on = "push"
  resolves = ["Docker Push"]
}

action "Docker Build" {
  uses = "actions/docker/cli@master"
  args = "build -t tpolekhin/goserve200:latest ."
}

action "Docker Registry" {
  uses = "actions/docker/login@master"
  needs = ["Docker Build"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker Push" {
  uses = "actions/docker/cli@master"
  args = "push tpolekhin/goserve200:latest"
  needs = ["Docker Registry"]
}
