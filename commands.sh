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