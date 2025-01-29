# resource "ibm_is_vpc" "vpc" {
#   provider = ibm
#   name     = "${var.prefix}-vpc-${var.region}"
# }

# resource "ibm_is_subnet" "subnet" {
#   provider = ibm
#   name                     = "${var.prefix}-subnet-${var.region}"
#   vpc                      = ibm_is_vpc.vpc.id
#   total_ipv4_address_count = 64
#   zone                     = "${var.region}-1"
# }

# resource "ibm_is_ssh_key" "key" {
#   provider = ibm
#   name       = "${var.prefix}-key-${var.region}"
#   public_key = file("~/.ssh/id_ed25519.pub")
#   type       = "ed25519"
# }

data "ibm_is_image" "image" {
  provider = ibm
  name = "ibm-ubuntu-24-04-6-minimal-amd64-2"
}

# resource "ibm_is_instance" "is_instance2" {
#   provider = ibm
#   name    = "${var.prefix}-${var.region}"
#   image   = data.ibm_is_image.image.id
#   profile = "bx2-2x8"
#   primary_network_interface {
#     subnet = ibm_is_subnet.subnet.id
#   }
#   user_data = file("script.sh")
#   vpc  = ibm_is_vpc.vpc.id
#   zone = ibm_is_subnet.subnet.zone
#   keys = [ibm_is_ssh_key.key.id]
# }