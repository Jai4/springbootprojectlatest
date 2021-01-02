pipeline {
    agent {
        label 'mainmachine'
    }
    
     
     stages {
         stage('step one') {

             steps {
               sh 'echo "Hello World"'
               sh 'pwd'
               sh './gradlew build'
               sh 'docker version'
               sh 'docker image ls'
            }
              
         }
     }


}