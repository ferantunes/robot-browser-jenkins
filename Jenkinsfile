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
        stage('Robot Framework') {
            // agent { label 'windows10' }
            steps {
                echo '##################################################\n########### AGUARDANDO O SISTEMA SUBIR ###########\n######## 1 MINUTO PARA INICIAR OS TESTES #########\n##################################################'
                sleep 60
                
                echo '#############################################\n### INICIANDO TESTES COM ROBOT FRAMEWORK ####\n#############################################'
                git branch: 'master', credentialsId: '2bac0843-1542-4c89-872b-9b16c17a6e06', url: 'https://jenkins-certisign@bitbucket.org/csgnddnp/robot-squad-06.git'
                
                dir('web') {
                    //bat 'robot -d log -v AMBIENTE:hml -v BROWSER:chrome tests\\'
                    bat "pabot --processes 6 -d logs\\log-${BUILD_NUMBER} -v AMBIENTE:hml -v BROWSER:chrome tests\\gar\\*.robot"
                }
            }
        }
    }
}