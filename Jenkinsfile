pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build . -t huzaifaabbasi1122/newimage:v4"
            }
        }
        stage('Docker Hub Push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub_id', variable: 'dockerhubPwd')]) {
                    sh "docker login -u huzaifaabbasi1122 -p ${dockerhubPwd}"
                    sh "docker push huzaifaabbasi1122/newimage:v4"
                }
            }
        }
        stage('Run Container') {
            steps {
                withCredentials([string(credentialsId: 'machine_pass', variable: 'machine_pass')]) {
                    sh '''
                        #!/bin/bash
                        echo "hello world"
                        sshpass -p ${machine_pass} ssh root@192.168.136.21
                           docker pull huzaifaabbasi1122/newimage:v4
                           docker run huzaifaabbasi1122/newimage:v4
                           systemctl status docker
                    '''
                }
            }
        }
    }
}
