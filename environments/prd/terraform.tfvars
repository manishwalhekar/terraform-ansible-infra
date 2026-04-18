env     = "prd"
project = "terra-infra"
# region = "us-east-1"

instance_count = 2
instance_type  = "t3.micro"

key_name     = "terra-infra-key"
pub_key_path = "../../keys/terra-infra-key.pub"

# instances = [
#   {
#     name          = "app"
#     instance_type = "t3.small"
#     ami           = "ami-0c02fb55956c7d316"
#     role          = "app"
#   },
#   {
#     name          = "worker"
#     instance_type = "t3.micro"
#     ami           = "ami-0c02fb55956c7d316"
#     role          = "worker"
#   }
# ]