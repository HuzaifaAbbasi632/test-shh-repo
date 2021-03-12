pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build . -t huzaifaabbasi1122/newimage:image "
            }
        }
        stage('Docker Hub Push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub_id', variable: 'dockerhubPwd')]) {
                    sh "docker login -u huzaifaabbasi1122 -p ${dockerhubPwd}"
                    sh "docker push huzaifaabbasi1122/newimage:image"
                }
            }
        }
        stage('Run Container') {
                def dockerrun = 'docker run --name my-app huzaifaabbasi1122/newimage:image'
                sshagent(['ssh_key']) {
                     sh 'ssh -o StrictHostKeyChecking=no root@192.168.136.11 ${dockerrun}'
                }
        }
    }
}
