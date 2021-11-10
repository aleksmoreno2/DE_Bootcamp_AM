Data Engineering Bootcamp
First Delivery Report
Autor: Alejandra Elizabeth Moreno Morales

Task description
Based on the self-study material, recorded and live session, and mentorship covered until this deliverable, we suggest you perform the following:
Take as reference Terraform reference, identify and select the corresponding terraform blocks to build your own Airflow Cluster.
Airflow Cluster must be built with GKS in Google or EKS in AWS.
In case of some difficulties, take advantage of templates provided by Wizeline to build and start your Airflow Cluster.
Take your notes about any blocker and your lessons learned to be discussed during Q&A and Mentoring sessions.

Target
Implement configuration for run an Airflow cluster in a Google Kubernetes Services (GKS) of Google Cloud Platform (GCP) using Terraform as tool to declare the configuration files.![image](https://user-images.githubusercontent.com/91718364/141061600-a104a1a1-e10a-4988-a66a-43f2695af909.png)


Prerequisites
•	Terraform configuration
To run configuration files with the declaration of the infrastructure as code.
•	GCP account
To deploy resources requested
Be aware of:
-Configure a Service account to be used on behalf of terraform 
 
-Enable Compute Engine API and Kubernetes Engine API in order to Terraform could work on this configuration. 
•	GCloud SDK tool configuration
To be used as an access for GCP using your user account credentials and therefore Terraform be allowed to provision resources on GCloud.
•	Kubectl tool configuration
To be able to control Kubernetes clusters
•	Helm3
To manage the Kubernetes application.

Terraform configuration files

	main.tf. Declare provisions needed. A VPC and subnet will be created. Also deploy a 2-node separately managed node pool GKE cluster. And SQL resource running PostgreSQL 12.
	output.tf. Define outputs values after creation.
	provider.tf. Configures the specified provider to Terraform uses to create and manage your resources.
	terraform.tfvars. Template used to set the values for variables
	variables.tf. Declare the variables name, description and default value to be used in the project.

Implementation
1.	Create and customize the Terraform files to deploy the infrastructure needed. See Terraform configuration files
2.	Initialize your Terraform workspace to install the plugins needed to manage the infrastructure
 


Create EKS cluster
3.	Run Terraform apply and review the planned actions. Your terminal output should indicate the plan is running and what resources will be created. Confirm the apply.
 
4.	Upon successful application, your terminal prints the outputs and save in terraform.tfstate
 
5.	Review resources created in GCP console
 
 
 
 
6.	Once that the cluster is created, set the kubectl context
 
Create NFS Service
7.	Create a namespace for the nsf service
 




8.	Create the nfs server





Create Storage
9.	Create a namespace for storage deployment

10.	Add the chart for the nfs-provisioner

11.	Install nfs-external-provisioner

Create Airflow
12.	Create a namespace for airflow deployment
 
13.	Add the chart repository















14.	Update airflow-values.yaml file with the project values
 














15.	 Install the airflow chart from the repository

16.	Verify that our pods are up and running








17.	Accessing to Airflow dashboard
