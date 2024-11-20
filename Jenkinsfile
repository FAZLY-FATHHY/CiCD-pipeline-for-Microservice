pipeline {
    agent any

    stages {
        stage('Build & Tag Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'fcc64174-5d6c-4fa4-a380-cdb847847370', toolName: 'docker') {
                        sh "docker build -t fazlyfathhy/adservice:latest ."
                    }
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'fcc64174-5d6c-4fa4-a380-cdb847847370', toolName: 'docker') {
                        sh "docker push fazlyfathhy/adservice:latest "
                    }
                }
            }
        }
    }
}
