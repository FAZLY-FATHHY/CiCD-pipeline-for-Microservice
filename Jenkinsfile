pipeline {
    agent any

    stages {
        stage('Build & Tag Docker Image') {
            steps {
                timeout(time: 30, unit: 'MINUTES') { // Timeout to prevent hanging
                    retry(2) { // Retry in case of transient failures
                        script {
                            withDockerRegistry(credentialsId: 'fcc64174-5d6c-4fa4-a380-cdb847847370', toolName: 'docker') {
                                echo "Building Docker image..."
                                sh "docker build -t fazlyfathhy/adservice:v1 ."
                            }
                        }
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                retry(2) { // Retry for potential transient push issues
                    script {
                        withDockerRegistry(credentialsId: 'fcc64174-5d6c-4fa4-a380-cdb847847370', toolName: 'docker') {
                            echo "Pushing Docker image to DockerHub..."
                            sh "docker push fazlyfathhy/adservice:v1"
                        }
                    }
                }
            }
        }

        stage('Cleanup') { // Optional cleanup step
            steps {
                echo "Cleaning up unused Docker resources..."
                sh "docker system prune -af || true"
            }
        }
    }
}
