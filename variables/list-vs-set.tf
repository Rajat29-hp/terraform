variable "users" {
  type = list
  default = ["usera", "userb",,"userc"]
}

output"user-data"{
value = var.users
}
#------------------------------------------------------

variable "users-name"{
type = set(string)
  default = ["usera", "userb",,"userc"]
}

output"user-data"{
value = var.users-name
}
