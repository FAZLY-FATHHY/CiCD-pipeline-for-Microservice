pipeline {
    agent any

    stages {
         stage('Build & Tag Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        sh "docker build -t fazlyfathhy/checkoutservice"
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Ensure Docker login before pushing the image
                    withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        // Log in to Docker Hub again before pushing
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    }
                    // Push the image to Docker Hub
                    sh "docker push fazlyfathhy/checkoutservice"
                }
            }
        }
    }
}
