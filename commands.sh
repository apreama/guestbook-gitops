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