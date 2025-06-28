pipeline {
    agent {
        docker {
            image 'maven:3.9-eclipse-temurin-21'
            args '-v $HOME/.m2:/root/.m2'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/binoyzone/java-selenium-docker'
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
                    reportDir: 'target/surefire-reports',
                    reportFiles: 'index.html',
                    reportName: 'Test Report'
                ])
            }
        }
    }

    post
    {
            always
            {
    //             archiveArtifacts artifacts: '**/target/surefire-reports/*.xml', allowEmptyArchive: true
    //             archiveArtifacts artifacts: 'target/html-report/index.html', allowEmptyArchive: true
                echo 'Build completed successfully!'
            }
            success
            {
                echo 'Build and tests completed successfully!'
            }
            failure
            {
                echo 'Build or tests failed!'
            }
    }
}