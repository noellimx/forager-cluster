resource "helm_release" "sealed-secrets" {
  chart            = "sealed-secrets"
  name             = "sealed-secrets"
  namespace        = "sealed-secrets"
  repository       = "https://bitnami-labs.github.io/sealed-secrets"
  create_namespace = true
}
