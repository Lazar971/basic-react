pipeline {
    agent {
        docker{
            image 'smebberson/alpine-nginx-nodejs'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true' 
    }
    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }
        stage('Remove tsconfig.json') {
            steps {
                sh 'rm tsconfig.json'
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
        stage('Serve') { 
           
            steps {
                sh 'cp -avr ./build /usr/share/nginx/html'
            }     
        }
    }

}