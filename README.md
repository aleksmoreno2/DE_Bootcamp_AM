### Airflow Cluster Implementation Running In Kubernetes
***Autor:** Alejandra Elizabeth Moreno Morales*

**Objective**
Implement configuration for run an Airflow cluster in a Google Kubernetes Services (GKS) of Google Cloud Platform (GCP) using Terraform as tool to declare the configuration files.

**Prerequisites**
• Terraform configuration
• GCP account
-Configure a Service account to be used on behalf of terraform
-Enable Compute Engine API and Kubernetes Engine API
• GCloud SDK tool configuration
• Kubectl tool configuration
• Helm3 configuration

**Terraform configuration files**
- main.tf. Declare provisions needed. A VPC and subnet will be created. Also deploy a 2-node separately managed node pool GKE cluster. And SQL resource running PostgreSQL 12.
- output.tf. Define outputs values after creation.
- provider.tf. Configures the specified provider to Terraform uses to create and manage your resources.
- terraform.tfvars. Template used to set the values for variables
- variables.tf. Declare the variables name, description and default value to be used in the project.

**Implementation**
1. Create and customize the Terraform files to deploy the infrastructure needed. See Terraform configuration files
2. Initialize your Terraform workspace to install the plugins needed to manage the infrastructure
![image](https://user-images.githubusercontent.com/91718364/141063919-455b0364-18f2-4b70-82ef-f933fd37d2f7.png)

**Create EKS cluster**
3. Run Terraform apply and review the planned actions. Your terminal output should indicate the plan is running and what resources will be created. Confirm the apply.
![image](https://user-images.githubusercontent.com/91718364/141063000-29da7fda-a0e2-4813-9a9c-eed7955bbebc.png)
4. Upon successful application, your terminal prints the outputs and save in terraform.tfstate
5. Review resources created in GCP console
![image](https://user-images.githubusercontent.com/91718364/141063038-e3cfbde4-960a-4af4-ae06-93718038b6bd.png)
![image](https://user-images.githubusercontent.com/91718364/141063046-16551bc6-64af-48ff-b821-c4dc433ae028.png)
![image](https://user-images.githubusercontent.com/91718364/141063052-1fd042c7-a8fd-4eb8-99bd-e91849b72167.png)
![image](https://user-images.githubusercontent.com/91718364/141063059-3d2aeb32-8221-4fe1-92c5-c363a7c656d3.png)
6. Once that the cluster is created, set the kubectl context
![image](https://user-images.githubusercontent.com/91718364/141063072-1154c58b-4c8e-4319-a1f1-adc8067231ad.png)

**Create NFS Service**
7. Create a namespace for the nsf service
![image](https://user-images.githubusercontent.com/91718364/141063109-eab20454-ee14-4a4b-831c-1384f415633d.png)
8. Create the nfs server
![image](https://user-images.githubusercontent.com/91718364/141063172-49251beb-efd1-4cfa-bf4e-fc2fb779f337.png)

**Create Storage**
9. Create a namespace for storage deployment
![image](https://user-images.githubusercontent.com/91718364/141063198-09861b48-6a19-41c0-b896-1a96e591a659.png)
10. Add the chart for the nfs-provisioner
![image](https://user-images.githubusercontent.com/91718364/141063289-a4cf0d12-028f-4490-b653-0cf2df4fdc89.png)
11. Install nfs-external-provisioner
![image](https://user-images.githubusercontent.com/91718364/141063299-78754f10-0f50-4e42-80e6-4bbcc5ca9612.png)

**Create Airflow**
12.	Create a namespace for airflow deployment
![image](https://user-images.githubusercontent.com/91718364/141063336-7db75ac5-1ef5-4afc-8f02-80c655500f62.png)
14. Add the chart repository
![image](https://user-images.githubusercontent.com/91718364/141063355-c5b4064b-7c19-44f7-9d3f-5a83cf0d1b11.png)
16. Update airflow-values.yaml file with the project values
![image](https://user-images.githubusercontent.com/91718364/141063380-8c56875d-d86d-4140-90e5-fd621b20cda1.png)
18. Install the airflow chart from the repository
![image](https://user-images.githubusercontent.com/91718364/141063426-0ff31b7a-6757-430c-a92d-4968ec847065.png)
![image](https://user-images.githubusercontent.com/91718364/141063438-14ec2f09-2a1e-4d06-ba15-828d09f34a53.png)
20. Verify that our pods are up and running
![image](https://user-images.githubusercontent.com/91718364/141063449-c062a82e-4a2a-47a1-a69a-b77f3eb9db00.png)
22.	Accessing to Airflow dashboard
![image](https://user-images.githubusercontent.com/91718364/141063473-ac88c046-66e8-4f50-9bbd-57ee3ce15abe.png)

**To destroy the EKS cluster**
terraform destroy --var-file=terraform.tfvars


