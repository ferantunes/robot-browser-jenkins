pipeline {
  agent {
    label 'win'
  }
  stages {
    // stage('Checkout external proj') {
    //     steps {
    //         git branch: 'main',
    //             credentialsId: 'github',
    //             url: 'https://github.com/ferantunes/robot-browser-jenkins.git'
    //     }
    // }
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
        }

        stage('Firefox') {
          steps {
            sh 'robot -d log -v BROWSER:firefox teste.robot'
          }
        }
        post {
          always {
            robot(outputPath: '.', logFileName: 'log/log.html', outputFileName: 'log/output.xml', reportFileName: 'log/report.hml', passThreshold: 100, unstableThreshold: 75)
              // robot(outputPath: '.', passThreshold: 100, unstableThreshold: 75)
              // archiveArtifacts 'log/log.html, log/output.xml, log/report.html, log/browser'
          }
        }
      }
        // stage('post') {
        //   steps([$class: 'InfluxDbPublisher', selectedTarget: 'jenkins'])
        // }
  }
}