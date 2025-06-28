pipeline {
    agent any
        environment {
                WORKSPACE_DIR = "${env.WORKSPACE}".replaceAll('\\\\', '/')
                M2_DIR = "${env.USERPROFILE}\\.m2".replaceAll('\\\\', '/')
            }


    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/binoyzone/java-selenium-docker'
            }
        }

        stage('Build & Test') {
            steps {
                script
                    {
                        docker.image('maven:3.9-eclipse-temurin-21').inside(
                            "-v ${M2_DIR}:/root/.m2 -w /workspace"
                    )
                    {
                        sh 'mvn clean test'
                    }
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