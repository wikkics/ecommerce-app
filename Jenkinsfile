pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DEV_IMAGE = 'wikkics/ecommerce-app-dev:latest'
        PROD_IMAGE = 'wikkics/ecommerce-app-prod:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ecommerce-app:latest .'
            }
        }

        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker tag ecommerce-app:latest $DEV_IMAGE
                    docker push $DEV_IMAGE
                '''
            }
        }

        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker tag ecommerce-app:latest $PROD_IMAGE
                    docker push $PROD_IMAGE
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
