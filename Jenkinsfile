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
            }
              
         }
     }


}