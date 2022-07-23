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
              robot(outputPath: '.', passThreshold: 100, unstableThreshold: 75)
              archiveArtifacts 'log/log.html, log/output.xml, log/report.html, log/browser'
            }

          }
          steps {
            sh 'robot -d log -v BROWSER:webkit teste.robot'
          }
        }

        stage('Firefox') {
          steps {
            sh 'robot -d log -v BROWSER:firefox teste.robot'
          }
        }

        stage('Teste') {
          steps {
            archiveArtifacts 'robot-browser-jenkins_main/log/log.html'
          }
        }

      }
    }

  }
}