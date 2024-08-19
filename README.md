# NHG_Technical_Assessment
Deploying a Static Website on Azure using ARM or Bicep Templates with Azure DevOps Pipelines

# Repo
## Structure
The repo is structured to store the IaC for the Azure Infrastructure, and the deployment Pipeline
The Azure resources are split into modules, to allow reusability. Parameter files are used to avoid hard coding values and allow future infrastructure changes/deployments without needing to make multiple changes to the resource module
# Pipeline
The pipelines are set up in azure devops, with two enviroments prod and dev
secure pipeline objects to be stored in variable groups, to ensure secrets are not kept in plain text
