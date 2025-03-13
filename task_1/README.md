# Infrastructure Provisioning with AWS 


## This Terraform code sets up an AWS infrastructure in `us-east-1`:



1. **VPC**: Creates a VPC with a CIDR block of `10.0.0.0/16`.
2. **Subnet**: Adds a public subnet (`10.0.1.0/24`) with auto-assigned public IPs.
3. **Internet Gateway**: Attaches an Internet Gateway to the VPC.
4. **Route Table**: Configures a route table to route traffic (`0.0.0.0/0`) through the Internet Gateway.
5. **Security Group**: Defines a security group allowing HTTP (port 80) and SSH (port 22) access, with full outbound access.
6. **EC2 Instance**: Launches a `t2.small` instance in the public subnet with the defined security group.

This setup creates a basic public-facing web server environment.