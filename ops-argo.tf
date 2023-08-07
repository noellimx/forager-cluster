



# ArgoCD Installation

# (4)
resource "helm_release" "argocd" {
  chart            = "argo-cd"
  name             = "argocd"
  namespace        = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  create_namespace = true
}

# (5)
resource "helm_release" "argocd-apps" {
  depends_on = [helm_release.argocd]
  chart      = "argocd-apps"
  name       = "argocd-apps"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"

  # (6)
  # values = [
  #   file("argocd/applications.yaml")
  # ]
}
