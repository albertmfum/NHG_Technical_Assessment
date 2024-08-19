//Module Metedate
@metadata({
  moduleDescription: 'Module to deploy/update the app service plan and app service resource, related to the static webapp. Webapp code to be stored and deploy from storage account'
})

//Parameters
@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the appservice Resource, should be globally unique')
param webAppName string 

@description('The SKU of App Service Plan')
param sku string = 'F1' 

@description('The runtime stack of web app')
param linuxFxVersion string = 'node|14-lts' 

@description('Tags object to apply tag data to resources')
param tags object



//Vars
var appServicePlanName = toLower('AppServicePlan-${webAppName}')
var webSiteName = toLower('wapp-${webAppName}')

//Resources
resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  tags: tags
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

resource webAppService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}
//Outputs
output webAppResourceID string = webAppService.id
output appServiceResourceID string = appServicePlan.id
