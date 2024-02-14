locals {
  platform1 = "web"
  platform2 = "db"
  vm1_name = "netology-${ var.vpc_name }-platform-${ local.platform1}"
  vm2_name = "netology-${ var.vpc_name }-platform-${ local.platform2}"
}