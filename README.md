terraform_demo
Terraform Concepts:

Providers
Resource
Variables (Arguments)
Outputs (Attributes)
Terraform Installation:

Download the zip file
Extract it to c:\terraform
Add the terraform installation location to the PATH environment variable.
Git Bash Terminal and check the 'terraform version'
AWS Provider Setup:

Download & Install AWS CLI
Open Git Bash Terminal and check the 'aws version'
Setup the AWS CLI
Configure AWS by using 'aws configure' command
'Access Key' and 'Secret Key' has to be setup
Agenda:

Launch EC2 instance using terraform.
AMI
Type of Instance
Terraform:

Provider: AWS
Resource: EC2 Instance
Variables:
ami
instnace type
sg
Create custom SG.
key pair
userdata
Outputs:
Public IP Address
Data Type
Editor:

VS Code Editor
Download file and Install
Open the VS code editor -> Open the Folder
Terraform Workflow:

Code -> Plan -> apply
destroy