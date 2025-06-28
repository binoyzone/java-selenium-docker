pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t selenium-runner .'
            }
        }

        stage('Run Tests in Docker') {
            steps {
                sh 'docker run --rm -v $PWD:/app selenium-runner'
            }
        }

        stage('Publish Reports') {
            steps {
                junit 'target/surefire-reports/*.xml'
                publishHTML(target: [
                    reportDir: 'target/surefire-reports',
                    reportFiles: 'index.html',
                    reportName: 'HTML Report'
                ])
            }
        }
    }
}
