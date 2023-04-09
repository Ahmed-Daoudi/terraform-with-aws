variable REGION {
    default = "us-east-1"
}

variable ZONE1 {
    default = "us-east-1a"
}

variable AMIS {
    type = map 
    default = {
        us-east-1 = "ami-0557a15b87f6559cf"
        us-east-2 = "ami-0557a15b87f6559cf"
    }
}

variable USER {
    default="ec2-user"
}