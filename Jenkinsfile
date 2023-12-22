pipeline {

    agent any
    
     tools {nodejs "node"} 

 parameters {
        
         choice(name: 'CYPRESS_TAGS', choices: ['@getFactorial','@smoke'], description: "Choice the tag that you want to execute your scripts")
    }


     options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        
        stage('Build'){
           
            steps {
                echo "Building the application"
                
            }
        }
        
        stage('Testing') {
            steps {
                sh "npm run PensaTestWithReportGeneration"
            }

        }
        
        stage('Deploy'){
            steps {
                
                echo('Deploy Test Result Report to s3')
                sh ''    
            }
        }

    }
    post{
        always{
            slackSend( channel: "#testautomationreport", token: "TQVutIj4EyynF1ZP7trYMh5J", color: "good", message: "Web Automation Test Report - ")
        }
    }

   

}