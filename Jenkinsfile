pipeline {
  agent {
    label 'win'
  }
  stages {
    stage('Robot Framework') {
      parallel {
        stage('Edge') {
          steps {
            sh 'robot -d log -v BROWSER:chromium teste.robot'
          }
        }
        stage('Safari') {
          steps {
            sh 'robot -d log -v BROWSER:webkit teste.robot'
          }
          post {
            always {
              robot(outputPath: '.', logFileName: 'log/log.html', outputFileName: 'log/output.xml', reportFileName: 'log/report.hml', passThreshold: 100, unstableThreshold: 75)
              archiveArtifacts 'log/log.html, log/output.xml, log/report.html, log/browser'
              publishHTML (target : [allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: '.',
                reportFiles: 'log/log.html',
                reportName: 'My Reports',
                reportTitles: 'The Report'])
            }
          }
        }
        stage('Firefox') {
          steps {
            sh 'robot -d log -v BROWSER:firefox teste.robot'
          }
          // post {
          //   always {
          //     robot(outputPath: '.', logFileName: 'log/log.html', outputFileName: 'log/output.xml', reportFileName: 'log/report.hml', passThreshold: 100, unstableThreshold: 75)
          //     archiveArtifacts 'log/log.html, log/output.xml, log/report.html, log/browser'
          //   }
          // }
        }

      }
    }

  }
}