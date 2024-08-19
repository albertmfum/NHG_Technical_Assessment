//Parameters, tbo in paramaters file
param endpointName string
param originURL string //*TODO*
param profileName string
param saName string
param wappName string
param waapInsights string
@secure()
param appID string
param kvName string
param softdelete int
@secure()
param tenantID string

//Vars
var tags = {
  resourceOwner: 'TBC'
  createdBy: 'albertmfum'
  managedBy: 'TBC'
  location: 'uksouth'
}


//modules

module cdn 'modules/cdn/cdn.bicep' = {
  name: 'deploy-cdn'
  params: {
    tags: tags
    endpointName: endpointName
    originUrl: originURL
    profileName: profileName
  }
}

module sa 'modules/storageAccount/storageAccount.bicep' = {
  name: 'deploy-storageAccount'
  params: {
    tags: tags
    storageAccountName: saName
  }
}

module la 'modules/logAnalytics/logAnalytics.bicep' = {
  name: 'deploy-laWorkspace'
  params: {
    tags: tags
    wappInsights: waapInsights
  }
}

module webapp 'modules/webApp/webApp.bicep' = {
  name: 'deploy-webApp'
  params: {
    tags: tags
    webAppName: wappName
  }
}

module kv 'modules/keyVault/keyvault.bicep' = {
  name: 'deploy-keyVault'
  params: {
    tags: tags
    applicationID: appID
    kvName: kvName
    softDelete: softdelete
    tenantID: tenantID
  }
  dependsOn: [
    webapp
    cdn
  ]
}

