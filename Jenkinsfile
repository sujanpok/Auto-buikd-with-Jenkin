pipeline {
    agent any
    
        environment {
        DOCKER_IMAGE = 'app_image'  //  image name
    }
    
    
    tools {
        maven 'maven_3_6_3' // Ensure this matches the configured Maven installation
    }
    
    stages {
         stage('Build and Test') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sujanpok/Auto-buikd-with-Jenkin.git']])
                sh 'mvn clean test'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE)
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Docker run
                    docker.image(env.DOCKER_IMAGE).run('-p 9090:9090 --name myappcontainer')
                }
            }
        }
    }
}
