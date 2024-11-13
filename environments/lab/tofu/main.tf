terraform {
  required_version = ">= 0.14"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

variable "environment_root" {
    type = string
    description = "Path to environment root, automatically set by activate script"
}

module "cluster" {
  source = "../../skeleton/{{cookiecutter.environment}}/terraform/"

  cluster_name = "lab1" # TODO: update me
  key_pair = "lab1" # TODO: update me
  cluster_image_id = "b6ea1356-df40-4aa2-a313-77be57c5e8d1" # openhpc-RL9-241009-1523-354b048a, v1.154
  control_node_flavor = "general.v1.4cpu.8gb"

  login_nodes = {
      login-0: "general.v1.4cpu.8gb"
  }

  compute = {
    general = {
        flavor = "general.v1.2cpu.4gb"
        nodes = [
          "general-0",
          "general-1",
        ]
    }
  }

  environment_root = var.environment_root
  cluster_net = "slurm-workshop"
  cluster_subnet = "slurm-workshop"
  state_volume_size = 10
  home_volume_size = 20
}
