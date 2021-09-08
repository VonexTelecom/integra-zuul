pipeline {
    agent any 
    tools {
        maven 'Maven 3.8.1'
        jdk 'jdk8'
    }
    stages {
        stage ('Build') {
            steps {    
                sh ' mvn clean install -DskipTests'
            }
        }
        /*stage ('Test') {
            steps {    
                sh ' mvn test'
            }
        }*/        
        stage ('Imagem docker') {
            steps {
                sh 'docker build . -t vonex/api_zuul:${BUILD_NUMBER}'
            }
        }
        stage ('Run docker') {
            steps {
                //sh ' docker stop integra-zuul' 
                //sh ' docker rm integra-zuul'                
                sh ' docker container run --network intranet -d --name integra-zuul -p 8081:8081 vonex/api_zuul:${BUILD_NUMBER}'
            }
        }        
    }
}


