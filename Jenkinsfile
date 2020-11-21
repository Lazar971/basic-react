pipeline {
    agent {
        docker{
           image 'smebberson/alpine-nginx-nodejs:4.4.0'
           args '-p 8081:8081 -i --entrypoint= --user root'
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