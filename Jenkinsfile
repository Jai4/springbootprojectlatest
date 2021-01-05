@Library('JenkinsSharedLibLatest') _


pipeline {
    agent {
        label 'mainmachine'
    }
    
     
     stages {
          stage('one') {
            steps {
                united useLocalStack: true
            }
        }
         stage('second') {
            steps {
                echo 'i am getting executed'
            }
        }
         
         
     }


}
