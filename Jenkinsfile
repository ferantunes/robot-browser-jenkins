pipeline {
    agent { label 'win' }
    
    // parameters {
    //     text(name: 'VERSION', defaultValue:'', description: 'Informe o número da versão. Ex. 2.0.10')
    // }
    
    // tools {
    //     maven 'Maven-3.3.9'
    //     jdk 'JDK-8u152x64'
    // }

    stages {
        stage('Edge') {
            // agent { label 'windows10' }
            steps {
                // echo '##################################################\n########### AGUARDANDO O SISTEMA SUBIR ###########\n######## 1 MINUTO PARA INICIAR OS TESTES #########\n##################################################'
                // sleep 60
                
                // echo '#############################################\n### INICIANDO TESTES COM ROBOT FRAMEWORK ####\n#############################################'
                // git branch: 'main', credentialsId: '2ef6d091-fedc-4250-9ba0-eb6b1f496966', url: 'https://github.com/ferantunes/robot-browser-jenkins.git'
                
                // dir('web') {
                //     //bat 'robot -d log -v AMBIENTE:hml -v BROWSER:chrome tests\\'
                //     bat "pabot --processes 6 -d logs\\log-${BUILD_NUMBER} -v AMBIENTE:hml -v BROWSER:chrome tests\\gar\\*.robot"
                // }

                sh 'robot -d log -v BROWSER:chromium teste.robot'
            }
        },
        stage('Firefox') {
            // agent { label 'windows10' }
            steps {
                // echo '##################################################\n########### AGUARDANDO O SISTEMA SUBIR ###########\n######## 1 MINUTO PARA INICIAR OS TESTES #########\n##################################################'
                // sleep 60
                
                // echo '#############################################\n### INICIANDO TESTES COM ROBOT FRAMEWORK ####\n#############################################'
                // git branch: 'main', credentialsId: '2ef6d091-fedc-4250-9ba0-eb6b1f496966', url: 'https://github.com/ferantunes/robot-browser-jenkins.git'
                
                // dir('web') {
                //     //bat 'robot -d log -v AMBIENTE:hml -v BROWSER:chrome tests\\'
                //     bat "pabot --processes 6 -d logs\\log-${BUILD_NUMBER} -v AMBIENTE:hml -v BROWSER:chrome tests\\gar\\*.robot"
                // }

                sh 'robot -d log -v BROWSER:firefox teste.robot'
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