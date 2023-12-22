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

                 sh """curl -X POST -H 'Content-type: application/json' --data '{"text":"Rapora Ulaşmak İçin: ReportLinki"}' https://hooks.slack.com/services/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"""
                
            }
        }

    }
    post{
        always{
            slackSend( channel: "testautomationreport", token: "xoxe.xoxp-1-Mi0yLTYzODUzNDYwODE0NzUtNjQwODIzNjkxNzI0OC02Mzg1ODYyMTI1OTcwLTYzODgzMTI1NTYxNjQtYzI3YmUzNzFlY2E5NjdmMGQ4NDFhYjMwMGM4OGZhYjExYjA2ZTMzYmE4MjU5ZjBmOTFhNTdmNzEzMmIyYWU5Nw", color: "good", message: "Web Automation Test Report - ")
        }
    }

   

}