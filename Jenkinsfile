pipeline {
    agent {
        docker{
           image 'node:15.2.1-alpine3.10'
         
        }
    }
    environment {
        CI = 'true' 
    }
    stages {
       
        stage('Install') {
            steps {
                sh 'node --version'
                sh 'npm install'
                sh 'npm i -g typescript'
            }
        }
        stage('Remove tsconfig.json') {
            steps {
                sh 'rm tsconfig.json'
                sh 'ls'
            }
        }
        stage('Test') { 
            steps {
                sh 'npm test' 
            }
        }
       stage('Build') { 
            steps {
              sh 'npm run build'
            }
        }
        
    }

}