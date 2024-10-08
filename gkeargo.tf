provider "google" {
  project = "clear-practice-430609-e0"
  region  = "us-central1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  create_namespace = true
  version    = "3.35.4"

  values = [file("values/argocd.yaml")]
}