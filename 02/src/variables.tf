###cloud vars
variable cloud {
  type = map(object({
    cloud_id = string
    folder_id = string
    default_zone = string
    default_cidr = list(string)
    vpc_name = string
  }))
    default = { 
      "develop" = {
        cloud_id = "b1g66n0nchd3o474t6jq"
        folder_id = "b1g5lr038h98q79traaf"
        default_zone = "ru-central1-a"
        default_cidr = ["10.0.1.0/24"]
        vpc_name = "develop"
      }
  }
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
  description = "VPC network & subnet name"
}
variable "token"{
  type        = string
  description = "enter secret token"
}


variable vm {
  type = map(object({
    cores = number
    memory = number
    core_fraction = number
    image = string
  }))
    default = { 
      "web-develop" = {
        cores = 2
        memory = 1
        core_fraction = 5
        image = "ubuntu-2204-lts"
      },
      "db" = {
        cores = 2
        memory = 2
        core_fraction = 20
        image = "ubuntu-2204-lts"
        zone = "ru.central1-b"
      }
  }
}



###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIL089Y5GGOpFLjqBNjSOe0D1Hiuti6VD5ObRVeiGFg9 root@net1"
  description = "ssh-keygen -t ed25519"
}
