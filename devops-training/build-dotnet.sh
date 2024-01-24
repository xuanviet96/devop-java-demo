export TAG=$(git rev-parse -short=10 HEAD | tail -n +2)

docker build dotnet/. -t devops-training-dotnet-dev:latest --build-arg BUILD_ENV=dev -f dotnet/Dockerfile
docker tag devops-training-dotnet-dev:latest [docker-registry]/devops-dotnet-app:$TAG
docker push [docker-registry]/devops-dotnet-app:$TAG
docker rmi -f [docker-registry]/devops-dotnet-app:$TAG

