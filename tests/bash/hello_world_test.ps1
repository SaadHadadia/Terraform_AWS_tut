# Exit immediately if a command fails
$ErrorActionPreference = "Stop"

# Change directory to example
Set-Location -Path "..\..\test-infra\infra"

# Initialize Terraform
terraform init

# Apply the Terraform configuration
terraform apply -auto-approve

# Wait while the instance boots up
Start-Sleep -Seconds 60

# Get the IP address from Terraform output
$ip = terraform output -json | ConvertFrom-Json | Select-Object -ExpandProperty instance_ip_addr

# Make the HTTP request
try {
    Invoke-WebRequest -Uri "http://$ip:8080" -TimeoutSec 10
    # If request succeeds, destroy the resources
    terraform destroy -auto-approve
} catch {
    Write-Error "HTTP request failed: $_"
}
