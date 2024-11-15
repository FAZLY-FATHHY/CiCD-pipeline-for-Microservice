pipeline {
    agent any

    stages {
        stage('Build & Tag Docker Image') {
            steps {
                script {
                    // Login to Docker Hub using the credentials ID 'docker-cred'
                    withDockerRegistry(credentialsId: 'docker-cred', url: 'https://index.docker.io') {
                        // Build the Docker image and tag it
                        sh "docker build -t fazlyfathhy/emailservice:latest ."
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub again and push the image
                    withDockerRegistry(credentialsId: 'docker-cred', url: 'https://index.docker.io') {
                        sh "docker push fazlyfathhy/emailservice:latest"
                    }
                }
            }
        }
    }
}
