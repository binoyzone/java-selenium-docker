pipeline {
    agent {
        docker {
            image 'maven:3.9.6-eclipse-temurin-17'
            args '-v $HOME/.m2:/root/.m2'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-user/your-selenium-project.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('Publish JUnit Report') {
            steps {
                junit '**/target/surefire-reports/*.xml'
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML(target: [
                    reportDir: 'target/html-report',
                    reportFiles: 'index.html',
                    reportName: 'Test Report'
                ])
            }
        }
    }
}

    post {
        always {
//             archiveArtifacts artifacts: '**/target/surefire-reports/*.xml', allowEmptyArchive: true
//             archiveArtifacts artifacts: 'target/html-report/index.html', allowEmptyArchive: true
            echo 'Build completed successfully!'
        }
        success {
            echo 'Build and tests completed successfully!'
        }
        failure {
            echo 'Build or tests failed!'
        }
    }
}