#/bin/sh

export TF_VAR_project_id="polished-triode-394707"
export TF_VAR_region="us-west3"
export TF_VAR_forager_helm_chart_version="0.1.4-20230808-007-010"
export TF_VAR_forager_helm_chart_repo="https://noellimx.github.io/forager-helm"
export TF_VAR_nginx_version="nginx:1.17.0"

export ARGOCD_AUTH_USERNAME=admin
export ARGOCD_AUTH_PASSWORD=

# export TF_LOG=DEBUG

terraform init -upgrade
# terraform plan
terraform apply -auto-approve

# export GOOGLE_CREDENTIALS=/Users/noel/repos/learn-terraform-provision-gke-cluster/application_default_credentials.json
# export GOOGLE_CREDENTIALS=/Users/noel/.config/gcloud/application_default_credentials.json

# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
