pipeline {
    agent {
        label 'mainmachine'
    }
    
     
     stages {
         stage('step one') {

             steps {
               sh 'echo "Hello World"'
               sh 'pwd'
               sh 'docker run --network host localstack/localstack'
               sh './gradlew build'
            }
              
         }
     }


}