workflow "Docker Build and Push" {
  on = "push"
  resolves = ["Docker Push"]
}

action "Docker Build" {
  uses = "docker://docker:stable"
  args = "build -t tpolekhin/goserve200:latest ."
}

action "Docker Registry" {
  uses = "docker://docker:stable"
  needs = ["Docker Build"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Docker Push" {
  uses = "docker://docker:stable"
  args = "images"
  needs = ["Docker Registry"]
}
