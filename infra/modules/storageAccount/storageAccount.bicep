//Module Metedate
@metadata({
  moduleDescription: 'Module to deploy standard storage account, intended to store static webapp files'
})

//Parameters
@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of storage account')
param storageAccountName string

@description('Tags object to apply tag data to resources')
param tags object

@description('Storage Account Access tier')
param accessTier string = 'Hot'

@description('Storage account type')
param saKind string = 'StorageV2'

@description('Storage account SKU')
param saSku string = 'Premium_LRS'
//Vars

//Resources

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  tags:tags
  location: location
  properties:{
     publicNetworkAccess: 'Disabled' //tbc
     accessTier: accessTier
  }
  kind: saKind
  sku: {
    name: saSku
  }
}
//Outputs
output saHostnameResourceID string = storageAccount.id
