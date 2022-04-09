flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=fleet-infra \
  --branch=main \
  --path=eksworkshop-eksctl \
  --personal
  
  
flux create source git guestbook-gitops \
  --url=https://github.com/apreama/guestbook-gitops \
  --branch=master \
  --interval=30s \
  --export > ./eksworkshop-eksctl/guestbook-gitops-source.yaml
  
  
flux create kustomization guestbook-gitops \
 --source=guestbook-gitops \
 --path="./deploy" \
 --prune=true \
 --interval=30m \
 --export > ./eksworkshop-eksctl/guestbook-gitops-sync.yaml

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

flux get sources git
  
flux get kustomizations

watch flux get kustomizations