export TAG=$(git rev-parse -short=10 HEAD | tail -n +2)

docker build nodejs/. -t devops-training-nodejs-dev:latest --build-arg BUILD_ENV=dev -f nodejs/Dockerfile
docker tag devops-training-nodejs-dev:latest [docker-registry]/devops-nodejs-app:$TAG
docker push [docker-registry]/devops-nodejs-app:$TAG
docker rmi -f [docker-registry]/devops-nodejs-app:$TAG
