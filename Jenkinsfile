pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build . -t huzaifaabbasi1122/newimage:v3"
            }
        }
        stage('Docker Hub Push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub_id', variable: 'dockerhubPwd')]) {
                    sh "docker login -u huzaifaabbasi1122 -p ${dockerhubPwd}"
                    sh "docker push huzaifaabbasi1122/newimage:v3"
                }
            }
        }
        stage('Run Container') {
            steps {
                sshagent(['server_key']) {
                    sh "ssh root@192.168.136.11 << HERE
                        date
                        hostname
                    HERE"
                }
            }
        }
    }
}
