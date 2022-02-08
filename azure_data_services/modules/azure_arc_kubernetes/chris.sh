az connectedk8s enable-features -n K8s_cluster -g AzureArc --features cluster-connect custom-locations
az k8s-extension create --name ext --extension-type microsoft.arcdataservices --cluster-type connectedClusters -c K8s_cluster -g AzureArc --scope cluster --release-namespace azure-arc --config Microsoft.CustomLocation.ServiceAccount=sa-bootstrapper
az customlocation create -n pureuksouth -g AzureArc --namespace azure-arc \
--host-resource-id $(az connectedk8s show -n K8s_cluster -g AzureArc --query id -o tsv) \
--cluster-extension-ids $(az k8s-extension show --name ext --cluster-type connectedClusters -c K8s_cluster -g AzureArc --query id -o tsv)
