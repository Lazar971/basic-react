pipeline {
    agent {
        docker{
           image 'tiangolo/node-frontend'
         
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
        stage('Deploy') { 
            steps {
                sh 'rm -r /usr/shared/nginx/html'
                sh 'mkdir /usr/shared/nginx/html'
                sh 'cp -r ./build /usr/shared/nginx/html'
            }
        }
    }

}