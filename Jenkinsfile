pipeline {

    agent any
    
     

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
                  sh 'npm install'
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

   

}