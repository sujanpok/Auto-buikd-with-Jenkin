pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/yourusername/yourrepository.git'
        GIT_BRANCH = 'yourbranch'
        DOCKER_IMAGE = 'myapp:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    git branch: "${GIT_BRANCH}", url: "${GIT_REPO}"
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Clean and package the application
                    sh 'mvn clean package'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }
        stage('Git Commit') {
            steps {
                script {
                    // Set Git config
                    sh 'git config user.email "you@example.com"'
                    sh 'git config user.name "Your Name"'

                    // Add changes and commit
                    sh 'git add .'
                    sh 'git commit -m "Automated commit by Jenkins"'

                    // Push changes to the repository
                    sh 'git push origin ${GIT_BRANCH}'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Stop and remove the old container if it exists
                    sh 'docker stop myapp || true'
                    sh 'docker rm myapp || true'
                    
                    // Run the new container
                    sh 'docker run -d --name myapp -p 8080:8080 ${DOCKER_IMAGE}'
                }
            }
        }
    }
}
