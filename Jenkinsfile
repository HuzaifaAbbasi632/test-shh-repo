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
                withCredentials([string(credentialsId: 'machine_pass', variable: 'machine_pass')]) {
                    sh '''
                        sshpass -p ${machine_pass} ssh -t -o StrictHostKeyChecking=no root@192.168.136.21
                        ls
                        pwd
                        whoami
                        echo "hello world"
                    '''
                }
            }
        }
    }
}
