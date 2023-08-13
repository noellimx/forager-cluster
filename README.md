


# Requirements

A live GKE cluster and access via `kubectl`.



# State update

`./prod.sh` sync via terraform apply.


# Notes

- Each helm template should be in its own file, otherwise terraform may not update the state properly.


## Access to argo admin
1. `kubectl port-forward svc/argocd-server -n argocd 8080:443` port forward to expose admin server locally.
2. Access via web. 

## Restart Deployment
`# kubectl rollout restart deployment forager --namespace=forager-helm` 