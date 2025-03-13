# Network Security

### To secure a Kubernetes cluster on AWS, follow these steps:

1. Setup my Kubernetes cluster in private subnet of VPC with Load Balancer in public subnet. 

2. Configure Security groups to restrict traffic to only necessary ports. 

3. Enable AWS WAF to protect against common web exploits.

4. Create IAM roles for Kubernetes nodes with the minimum permissions required

5. Use IAM Roles for Service Accounts (IRSA) to grant fine-grained permissions to Kubernetes pods.

6. Enable encryption at rest for EKS control plane logs and worker node volumes.

7. Use AWS Secrets Manager or HashiCorp Vault to manage sensitive credentials.

8. Regularly update Kubernetes and worker nodes to patch vulnerabilities.