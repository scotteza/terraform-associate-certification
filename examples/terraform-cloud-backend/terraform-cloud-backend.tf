terraform {
  backend "remote" {
    organization = "<ORG_NAME>"

    workspaces {
      name = "Example-Workspace"
    }
  }
}
