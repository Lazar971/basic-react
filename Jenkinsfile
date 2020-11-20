pipeline {
    agent {
        docker{
            image 'node:15.2-alpine3.10'
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
        stage('Ls') { 
            steps {
              sh 'ls && ls / && ls /usr/share'
            }
        }
        stage('Serve') { 
            steps {
              sh 'cp -avr ./build /usr/share/nginx/html'
            }
        }
    }

}