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
          post {
            always {
              robot(outputPath: '.', logFileName: 'log/log.html', outputFileName: 'log/output.xml', reportFileName: 'log/report.hml', passThreshold: 100, unstableThreshold: 75)
              // robot(outputPath: '.', passThreshold: 100, unstableThreshold: 75)
              // archiveArtifacts 'log/log.html, log/output.xml, log/report.html, log/browser'
            }

          }
          steps {
            sh 'robot -d log -v BROWSER:webkit teste.robot'
          }
        }

        stage('Firefox') {
          steps {
            sh 'robot -d log -v BROWSER:firefox teste.robot'
            archiveArtifacts 'log/log.html'
            sh 'print \'Oi\''
          }
          post {
            always {
              robot(outputPath: '.', logFileName: 'log/log.html', outputFileName: 'log/output.xml', reportFileName: 'log/report.hml', passThreshold: 100, unstableThreshold: 75)
              // archiveArtifacts 'log/log.html, log/output.xml, log/report.html, log/browser'
            }
          }
        }

        stage('post') {
          steps([$class: 'InfluxDbPublisher', selectedTarget: 'jenkins'])
        }
      }
    }

  }
}