pipeline {

agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            when {
             anyOf {
             branch 'not-exist'
             branch 'feature-test'
              }
            }
            steps {
                echo 'Deploying....'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }

    }
 post {
        always {
            echo 'I will always say Hello again!'
        }
       failure {
        echo 'Only show when failure`'
        }
    }

}
