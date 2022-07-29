pipeline{
    agent{
        label "win"
    }
    stages{
        stage("Robot"){
            parallel{
                stage("A"){
                    steps{
                        echo "========executing A========"
                        sh 'robot -d log/chrome -v BROWSER:chromium teste.robot'
                    }
                    post{
                        always{
                            echo "========always========"
                            robot(outputPath: '.',
                            logFileName: 'log/chrome/log.html',
                            outputFileName: 'log/chrome/output.xml',
                            reportFileName: 'log/chrome/report.hml',
                            passThreshold: 100,
                            unstableThreshold: 75)

                            // archiveArtifacts 'log/chrome/log.html, log/chrome/output.xml, log/chrome/report.html, log/chrome/browser'

                            step([$class: 'InfluxDbPublisher', target: 'jenkins'])
                        }
                        success{
                            echo "========A executed successfully========"
                        }
                        failure{
                            echo "========A execution failed========"
                        }
                    }
                }
                 stage("B"){
                    steps{
                        echo "========executing A========"
                        sh 'robot -d log/safari --log log_safari -v BROWSER:firefox teste.robot'
                    }
                    post{
                        always{
                            echo "========always========"
                            robot(outputPath: '.',
                            logFileName: 'log/safari/log.html',
                            outputFileName: 'log/safari/output.xml',
                            reportFileName: 'log/safari/report.hml',
                            passThreshold: 100,
                            unstableThreshold: 75)

                            archiveArtifacts 'log/safari/log.html, log/safari/output.xml, log/safari/report.html, log/safari/browser'

                            step([$class: 'InfluxDbPublisher', target: 'jenkins'])
                        }
                        success{
                            echo "========A executed successfully========"
                        }
                        failure{
                            echo "========A execution failed========"
                        }
                    }
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
            // robot(outputPath: '.',
            //     logFileName: 'log/chrome/log.html',
            //     outputFileName: 'log/chrome/output.xml',
            //     reportFileName: 'log/chrome/report.hml',
            //     passThreshold: 100,
            //     unstableThreshold: 75)
            // step([$class: 'InfluxDbPublisher', target: 'jenkins'])
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}