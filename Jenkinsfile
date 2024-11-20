pipeline {
    agent any

    stages {
        stage('Build & Tag Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'fcc64174-5d6c-4fa4-a380-cdb847847370', toolName: 'docker') {
                        // Build and tag the Docker image
                        sh "docker build -t fazlyfathhy/checkoutservice"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'fcc64174-5d6c-4fa4-a380-cdb847847370', toolName: 'docker') {
                        // Push the Docker image to the registry
                        sh "docker push fazlyfathhy/checkoutservice"
                    }
                }
            }
        }
    }
}

