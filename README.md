


# Requirements

A live GKE cluster and access via `kubectl`.

# Dependencies

# Notes

- Each helm template should be in its own file, otherwise terraform may not update the state properly.


# Access 
`kubectl port-forward svc/argocd-server -n argocd 8080:443`