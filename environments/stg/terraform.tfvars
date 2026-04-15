environment = "stg"
region      = "us-east-1"

instances = [
  {
    name          = "app"
    instance_type = "t3.small"
    ami           = "ami-0c02fb55956c7d316"
    role          = "app"
  },
  {
    name          = "worker"
    instance_type = "t3.micro"
    ami           = "ami-0c02fb55956c7d316"
    role          = "worker"
  }
]