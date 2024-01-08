variable "access_key" {
    description = "value"

  
}
variable "secret_key" {
    description = "value"

}

variable "vpc_id" {
    description = "value of target VPC"
    default = "ADDHERE"
  
}


variable "key_pair" {
    description = "value of key for SSH"
    default = "YOU_NAME"
  
}
  
variable "region" {
  description = "AWS region"
  default     = "us-east-2"
}


