node {
   def app
   
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Delete tsconfig') {
            steps {
                sh 'rm tsconfig.json'
            }
        }
        stage('Test') { 
            steps {
                sh 'npm test' 
            }
        }
        stage('Create image') { 
            steps {
               app=docker.build('example-app')
            }
        }
         stage('Deploy') { 
            steps {
                sh 'docker run -d example-app' 
            }
        }
    }

}