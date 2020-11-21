pipeline {
    agent {
        dockerfile{
           filename 'agent.build'
           dir '.'
           args ' -i --entrypoint= --user root'
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
        stage('Serve') { 
           
            steps {
                sh 'cp -avr ./build /usr/share/nginx/html'
            }     
        }
    }

}