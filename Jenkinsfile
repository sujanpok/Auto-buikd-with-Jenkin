pipeline {
    agent any
    
    tools{
         maven 'maven_3_5_0'
         }
        stages{
        stage('Buikd Maven'){
        steps{
        checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sujanpok/Auto-buikd-with-Jenkin.git']])
        sh 'mvn clean install'
        }
        
        }
        
        }
}
