# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions
1. Autheticate into Azure by using command `az login`
2. Define a policy rule or using the `policy_rule.json` file.
```
az policy definition create
--name 'deny-creation-if-untagged-resources'
--description 'This policy to make sure that all resources have tags'
--rules 'policy-required-tagging-rule.json'
```

3. Assign policy by using below command
```
az policy assignment create --name 'tagging-policy' --policy 'deny-creation-if-untagged-resources'
```

To verify the assignment list, use `az policy assignment list'

4. Create Server Image with Packer
Open the `server.json` file and modify `client_id`, `client_secret`, and `subscription_id`
You can also edit the `location` and `azure_tags` as you want.
Below command may help to query:
```
az ad sp create-for-rbac
--scopes /subscriptions/<YourSubcriptionID>
--query "{client_id: appId, client_secret: password, tenant_id: tenant}"
```

5. Create infrastructure with Terraform
Open file `vars.tf` and modify `prefix`, `resourceGroup`, `location`, `username`, etc
Open file `main.tf` and modify configuration as you needed

6. Deployment
Fristly, run below command to build Packer:
```
packer build server.json
```

Then run following command to deploy Terraform configuration:
```
terraform plan -out solution.plan
terraform apply "solution.plan"
```

### Output

**Step 2, 3: Define and assign policy**
![](./screenshots/1-Create%20tagging%20policy.png)
![](./screenshots/2-Assign%20policy%20using%20command.png)

**Step 4: Packer**
![](./screenshots/4-Build%20Packer.png)
![](./screenshots/5-Packer%20built.png)

**Step 5: Terraform**
![](./screenshots/7-Terraform%20solution%20plan.png)
![](./screenshots/8-Terraform%20applied.png)
