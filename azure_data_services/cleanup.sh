kubectl delete clusterrole arcdataservices-extension
kubectl delete clusterrole arc:cr-arc-metricsdc-reader
kubectl delete clusterrole arc:cr-arc-dc-watch
kubectl delete clusterrole cr-arc-webhook-job
kubectl delete clusterrole arc:cr-upgrade-worker
kubectl delete clusterrolebinding arc:crb-arc-metricsdc-reader
kubectl delete clusterrolebinding arc:crb-arc-dc-watch
kubectl delete clusterrolebinding crb-arc-webhook-job
kubectl delete clusterrolebinding arc:crb-upgrade-worker

