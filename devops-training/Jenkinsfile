pipeline {
   agent none
   environment {
        ENV = "$params.ENV"
        NODE = "Build-server"
    }

   stages {
    stage('Build Image') {
        agent {
            node {
                label "Build-server"
                customWorkspace "/home/ubuntu/jenkins/multi-branch/devops-training-$ENV/"
                }
            }
        environment {
            TAG = sh(returnStdout: true, script: "git rev-parse -short=10 HEAD | tail -n +2").trim()
        }
         steps {
            sh "docker build nodejs/. -t devops-training-nodejs-$ENV:latest --build-arg BUILD_ENV=$ENV -f nodejs/Dockerfile"

            sh "cat docker.txt | docker login -u [docker-registry] --password-stdin"
            // tag docker image
            sh "docker tag devops-training-nodejs-$ENV:latest [docker-registry]/devops-nodejs-app:$TAG"

            //push docker image to docker hub
            sh "docker push [docker-registry]/devops-nodejs-app:$TAG"

            sh "docker rmi -f [docker-registry]/devops-nodejs-app:$TAG"
           }
         
       }
	  stage ("Deploy ") {
	    agent {
        node {
            label "Target-Server"
                customWorkspace "/home/ubuntu/jenkins/multi-branch/devops-training-$ENV/"
            }
        }
        environment {
            TAG = sh(returnStdout: true, script: "git rev-parse -short=10 HEAD | tail -n +2").trim()
        }
	  	steps {
            sh "sed -i 's/{tag}/$TAG/g' /home/ubuntu/jenkins/multi-branch/devops-training-$ENV/docker-compose.yaml"
            sh "docker compose up -d"
        }      
	  }
   }
    
}
