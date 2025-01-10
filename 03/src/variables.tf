###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1g66n0nchd3o474t6jq"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g5lr038h98q79traaf"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIL089Y5GGOpFLjqBNjSOe0D1Hiuti6VD5ObRVeiGFg9 root@net1"
  description = "ssh-keygen -t ed25519"
}

variable vms {
  type = map(object({
    name = string
    cores = number
    memory = number
    core_fraction = number
    image = string
    network = string
    scheduling_policy = bool
    platform_id = string
    nat = bool  }))
    default = { 
      "web" = {
        name = "web"
        cores = 2
        memory = 1
        core_fraction = 5
        image = "fd833v6c5tb0udvk4jo6"
        network = "web-network"
        scheduling_policy = "true"
        platform_id = "standard-v1"
        nat = "true"
      },
      "stor" = {
        name = "stor"
        cores = 2
        memory = 1
        core_fraction = 5
        image = "fd833v6c5tb0udvk4jo6"
        network = "web-network"
        scheduling_policy = "true"
        platform_id = "standard-v1"
        nat = "true"
    }
  }
}

variable "each_vm" {
  type = list(object({
      vm_name = string
      cpu = number
      ram = number
      disk_volume = number
      core_fraction = number 
      image = string
      scheduling_policy = bool
      platform_id = string
      nat = bool
    }))
    default = [
      {
      vm_name="main"
      cpu = 2
      ram = 2
      disk_volume = 10
      core_fraction = 5 
      image = "fd833v6c5tb0udvk4jo6"
      scheduling_policy = "true"
      platform_id = "standard-v1"
      nat = true
    },
      {
      vm_name="replica"
      cpu = 2
      ram = 2
      disk_volume = 20
      core_fraction = 5 
      image = "fd833v6c5tb0udvk4jo6"
      scheduling_policy = "true"
      platform_id = "standard-v1"
      nat = true
    }
  ]
}