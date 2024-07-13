pipeline {
    agent any
    
    environment {
        DOCKER_HOST = 'tcp://192.168.3.111:2375'
        DOCKER_IMAGE_NAME = 'my-maven-app'
        CONTAINER_NAME = 'maven-app-container'
    }
    
    tools {
        // Define Docker tool
        dockerTool 'myDocker'
        
        // Define Maven tool
        maven 'Maven_3_6_3' // Ensure this matches the configured Maven installation
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git repository
                git url: 'https://github.com/sujanpok/Auto-buikd-with-Jenkin.git', branch: 'master'
            }
        }
        stage('Build') {
            steps {
                // Build the Maven project
                sh 'mvn clean install'
            }
        }
        stage('Package') {
            steps {
                // Package the Maven project
                sh 'mvn package'
            }
        }
        stage('Test Docker TCP Connection') {
            steps {
                script {
                    // Test Docker connection
                    sh """
                    docker info
                    """
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build Docker image using Dockerfile
                script {
                    sh """
                    docker build -t $DOCKER_IMAGE_NAME -f Dockerfile .
                    """
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                // Run Docker container
                script {
                    // Stop and remove any existing container with the same name
                    sh """
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    """
                    // Run the new container without specifying port mapping here
                    sh """
                    docker run -d --name $CONTAINER_NAME $DOCKER_IMAGE_NAME
                    """
                }
            }
        }
    }
}
