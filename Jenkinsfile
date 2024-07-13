pipeline {
    agent any
    
    environment {
        DOCKER_HOST = 'tcp://192.168.3.111:2375'
        DOCKER_IMAGE_NAME = 'my-maven-app'
        CONTAINER_NAME = 'maven-app-container'
    }
    
    tools {
        dockerTool 'myDocker'
        maven 'Maven_3_6_3'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/sujanpok/Auto-buikd-with-Jenkin.git', branch: 'master'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Test Docker TCP Connection') {
            steps {
                script {
                    sh """
                    docker info
                    """
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                    docker build -t $DOCKER_IMAGE_NAME -f Dockerfile .
                    """
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh """
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 8080:8080 $DOCKER_IMAGE_NAME
                    """
                }
            }
        }
    }
}
