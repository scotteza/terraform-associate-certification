variable "region" {
  default = "us-west-2"
}

# Declare implicitly by using brackets []
variable "cidrs" { default = [] }

# Declare explicitly with 'list'
variable "cidrs" { type = list }

# A variable can be explicitly declared as a map type, or it can be implicitly created by specifying a default value that is a map.
# Even if a map's data is set in a tfvar file, the variable must be declared separately with either type="map" or default={}.
variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-fc0b939c"
  }
}
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}

# Pass in variables from the command line: 
# terraform apply -var 'region=us-west-2'

# Or have this line in your terraform.tfvars file:
# region = "us-west-2"
# cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]

# Passing in a map var from the command line:
# terraform apply -var 'amis={ us-east-1 = "foo", us-west-2 = "bar" }'

# Or pass in var files manually:
# terraform apply -var-file="secret.tfvars" -var-file="production.tfvars"

# Setting a map's values on your terraform.tfvars file:
# amis = {
#   "us-east-1" = "ami-abc123"
#   "us-west-2" = "ami-def456"
# }

# Create an aws_instance with the amis and region.
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}

output "ami" {
  value = aws_instance.example.ami
}
