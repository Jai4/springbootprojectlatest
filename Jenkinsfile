@Library('jenkins-sharedlib') _


pipeline {
    agent {
        label 'mainmachine'
    }
    
     
     stages {
         stage('step one') {
             steps {
               sh 'echo "Hello World"'
               sh 'pwd'
      
               script{
                   hello
                  }
            }

         }
     }
}
