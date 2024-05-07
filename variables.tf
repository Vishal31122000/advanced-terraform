### VARIABLES
variable "region" {
  type    = string
  default = "us-east-2"
}

variable "subnet-cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "firewall-ports" {
  type    = list(string)
  default = ["80", "8080", "1000-2000", "22"]
}

variable "compute-source-tags" {
  type    = list(string)
  default = ["web"]
}

variable "target_environment" {
  type    = string
  default = "DEV"
}

variable "environment_list" {
  type    = list(string)
  default = ["DEV", "QA", "STAGE", "PROD"]
}

variable "environment_map" {
  type    = map(string)
  default = {
    "DEV"   = "dev"
    "QA"    = "qa"
    "STAGE" = "stage"
    "PROD"  = "prod"
  }
}

variable "environment_instance_settings" {
  type = map(object({
    machine_type = string
    tags         = map(string)
  }))
  default = {
    "DEV" = {
      machine_type = "t2.micro"
      tags         = {
        Name        = "web"
        Environment = "dev"
      }
    }
    "QA" = {
      machine_type = "t2.micro"
      tags         = {
        Name        = "web"
        Environment = "qa"
      }
    }
    "STAGE" = {
      machine_type = "t2.micro"
      tags         = {
        Name        = "web"
        Environment = "stage"
      }
    }
    "PROD" = {
      machine_type = "t2.micro"
      tags         = {
        Name        = "web"
        Environment = "prod"
      }
    }
  }
}