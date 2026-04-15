environment       = "prd"
region            = "us-east-1"
allowed_ssh_cidrs = ["10.0.0.0/8"]  # tighten SSH in prod

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
  },
  {
    name          = "compute"
    instance_type = "c7i-flex.large"
    ami           = "ami-0c02fb55956c7d316"
    role          = "compute"
  }
]