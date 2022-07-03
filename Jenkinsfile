pipeline {
    agent { label 'win' }

    stages {
        stage("Robot Framework") {
            parallel {
                stage('Edge') {
                    steps {
                        sh 'robot -d log -v BROWSER:chromium teste.robot'
                    }
                }
                stage('Firefox') {
                    steps {
                        sh 'robot -d log -v BROWSER:firefox teste.robot'
                    }
                }
            }
        }
    }
    post {
        always {
            robot outputPath: '.',
            logFileName: 'log/log.html',
            outputFileName: 'log/output.xml',
            reportFileName: 'log/report.hml',
            passThreshold: 100,
            unstableThreshold: 75.0
            archiveArtifacts artifacts: 'log/log.html'
        }
    }
}