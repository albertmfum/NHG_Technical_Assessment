//Module Metedate
@metadata({
  moduleDescription: 'Keyvault to store secure artifacts, such as SSL certificate. Keyvault access policies TBC'
})

//Parameters
@description('Tags object to apply tag data to resources')
param tags object

@description('Name of the key vault resource')
param kvName string

@description('Location for all resources.')
param location string = resourceGroup().location

@description('duration of soft delete policy')
param softDelete int

@description('Application ID of the service principle')
@secure()
@minLength(36)
@maxLength(36)
param applicationID string


@description('Tenant ID')
@secure()
param tenantID string

//Vars

//Resources

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: kvName
  location: location
  tags: tags
  properties: {
    accessPolicies: [
      {
        applicationId: applicationID
        objectId: 'string'
        permissions: {
          certificates: [
            'string'
          ]
          keys: [
            'string'
          ]
          secrets: [
            'string'
          ]
          storage: [
            'string'
          ]
        }
        tenantId: tenantID //insert organisation tenant id 
      }
    ]
    createMode: 'default'
    enabledForDeployment: true
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: true
    enablePurgeProtection: true
    enableRbacAuthorization: true
    enableSoftDelete: true
    networkAcls: {
      bypass: 'string'
      defaultAction: 'string'
      ipRules: [
        {
          value: 'string'
        }
      ]
      virtualNetworkRules: [
        {
          id: 'string'
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    provisioningState: 'string'
    publicNetworkAccess: 'string'
    sku: {
      family: 'A'
      name: 'standard'
    }
    softDeleteRetentionInDays: softDelete
    tenantId: tenantID
    // vaultUri: 'string'
  }
}

//Outputs
output kvResourceID string = kv.id
