pipeline{
	agent {label "java"}
    options{
        buildDiscarder(logRotator(numToKeepStr: '20'))
	}

	stages{
	    stage("clone"){
	        steps{
	            git 'https://github.com/quguanwen/my-demo-k8s.git'
	        }
	    }

	    stage("build"){
	        steps{
	            sh "mvn clean package"
	        }
	    }
	}
}