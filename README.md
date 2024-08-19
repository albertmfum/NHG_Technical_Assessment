# NHG_Technical_Assessment
Deploying a Static Website on Azure using ARM or Bicep Templates with Azure DevOps Pipelines

# Repo
## Structure
The repo is structured to store the IaC for the Azure Infrastructure, and the deployment Pipeline
The Azure resources are split into modules, to allow reusability. Parameter files are used to avoid hard coding values and allow future infrastructure changes/deployments without needing to make multiple changes to the resource module
# Pipeline
The pipelines are set up in azure devops, with two enviroments prod and dev
secure pipeline objects to be stored in variable groups, to ensure secrets are not kept in plain text
by using service connections and environments for dev and prod environments, we can use a blue-green deployment strategy

# TODO List
- Configure the Bicep templates to deploy the static website files to the storage account.
- Implement the necessary configurations for hosting the static website, including setting up the appropriate storage account settings and enabling CDN
- Utilize Pester, a testing framework for PowerShell, to write and execute tests against the deployed infrastructure. Create Pester tests to validate the correct deployment of the static website, including verifying the website content, CDN configuration, and overall functionality.
- complete code to production ready and merge into main