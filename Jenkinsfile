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
		input (
    message: 'Do you approve?',
    ok: 'Yes'		
  )
                echo 'Deploying....'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }

    }
 post {
        always {
            echo 'I will always say Hello again!'
emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
to: 'huynh.long.anh@gmail.com',                
subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"        
}
       failure {
        echo 'Only show when failure`'
        }
    }

}
