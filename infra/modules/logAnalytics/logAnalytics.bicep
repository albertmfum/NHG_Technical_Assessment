//Module Metedate
@metadata({
  moduleDescription: 'Module to deploy log analytics workspace, intended to store observibility data related to the static web app'
})

//Parameters
@description('Location for all resources.')
param location string = resourceGroup().location

@description('name of the Log ananlytics workspace')
param logAnalyticsWorkspace string = '${uniqueString(resourceGroup().id)}la'

@description('Name of the app insights resource')
param wappInsights string

@description('Tags object to apply tag data to resources')
param tags object


//Vars

//Resources

resource laWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsWorkspace
  tags: tags
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 90
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: wappInsights
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: laWorkspace.id
  }
}
//Outputs
output laWorkspaceID string = laWorkspace.id
