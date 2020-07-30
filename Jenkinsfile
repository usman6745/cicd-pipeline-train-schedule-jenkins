pipeline {
    agent any
	

    stages {
        stage('git-clone') {
        steps {
            git 'https://github.com/usman6745/cicd-pipeline-train-schedule-jenkins.git'
        }
            
        }
        stage('git-Clone-&_Build') {
            steps {
                echo 'Running build automation'
				sh 'echo $PWD'
                sh './gradlew build --no-daemon'
                archiveArtifacts artifacts: 'dist/trainSchedule.zip'
            }
        }
				
		stage('DeployToStaging') {
    //         when {
    //     branch 'master'
    //     }		
		   steps { 
		    withCredentials([usernamePassword(credentialsId: 'Webserver_Login', passwordVariable: 'password', usernameVariable: 'user')]) {
    // some block
	sshPublisher (
	   failOnError: true,
	   continueOnError: false,
	publishers: [
	 sshPublisherDesc(
	 configName: 'staging', 
	 /* sshCredentials: [
	     username: "$user",
	     password: "$password",
		 ], */
	transfers: [
	sshTransfer(
	   remoteDirectory: '/tmp',
	   removePrefix: 'dist',
	   sourceFiles: 'dist/trainSchedule.zip',
	   execCommand: 'echo $PWD && ls -l /tmp/ && uname -a'
	  // execCommand: './opt/train-schedule/npm_stop.sh >> /dev/null 2>&1 && rm -rf /opt/train-schedule >> /dev/null 2>&1 && unzip /tmp/trainSchedule.zip -d /opt/train-schedule && ./opt/train-schedule/npm_start.sh',
	   )
	   ]
	)
	]
	)
	
}   
		   }
		}
    }
}
