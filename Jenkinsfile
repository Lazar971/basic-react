pipeline {
    agent {
        docker{
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true' 
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') { 
            steps {
                sh 'npm test' 
            }
        }
        stage('Create image') { 
            steps {
                sh 'docker build -t example-app .' 
            }
        }
         stage('Deploy') { 
            steps {
                sh 'docker run -d example-app' 
            }
        }
    }

}