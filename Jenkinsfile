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
                        sh 'robot -d log -v BROWSER:chromium teste.robot'
                    }
                    post{
                        always{
                            echo "========always========"
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
            step([$class: 'InfluxDbPublisher', target: 'jenkins'])
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}