pipeline {
    agent any
    tools {
        maven 'maven_3_6_3' // Ensure this matches the configured Maven installation
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sujanpok/Auto-buikd-with-Jenkin.git']])
                sh 'mvn clean install'
            }
        }
    }
}
