export TAG=$(git rev-parse -short=10 HEAD | tail -n +2)
sed -i "s/{tag}/$TAG/g"  infra/api/dotnet-app/deployment.yaml

kubectl apply -f infra/api/dotnet-app/deployment.yaml