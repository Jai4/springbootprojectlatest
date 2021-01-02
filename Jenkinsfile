@Library('JenkinsSharedLibLatest') _


pipeline {
    agent {
        label 'mainmachine'
    }
    
     
     stages {
         stage('step one') {

             steps {
               sh 'echo "Hello World"'
               sh 'pwd'
               sh 'docker run --network host -d localstack/localstack'
               sh './gradlew build'

               united
            }
              
         }
     }


}