pipeline {
    agent any

    stages {

        stage('changing the file permission') {
            steps {
                sh 'chmod +x build.sh'
            }
        }

        stage('executing the file') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh './build.sh'
                }
            }
        }
    }
}
