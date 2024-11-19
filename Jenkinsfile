pipeline {
    agent any

    stages {
        stage('Build & Tag Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        // Build and tag the Docker image
                        sh "docker build -t fazlyfathhy/emailservice:latest ."
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        // Push the Docker image to the registry
                        sh "docker push fazlyfathhy/emailservice:latest"
                    }
                }
            }
        }
    }
}

