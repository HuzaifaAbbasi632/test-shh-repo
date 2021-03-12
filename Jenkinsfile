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
                    sh "docker push huzaifaabbasi1122/react:image"
                }
            }
        }
        /*stage('Deploy to K8s') {
            steps {
                sh 'chmod +x changeTag.sh'
                sh "./changeTag.sh ${DOCKER_TAG}"
                withCredentials([string(credentialsId: 'machine_pass', variable: 'machine_pass')]) {
                    sh "sshpass -p ${machine_pass} scp -o StrictHostKeyChecking=no node-app-pod.yml root@192.168.136.21:~ "
                    sh "sshpass -p ${machine_pass} scp -o StrictHostKeyChecking=no services.yml root@192.168.136.21:~ "
                    sh "sshpass -p ${machine_pass} ssh root@192.168.136.21 kubectl apply -f . "
                }
            }
        }*/
    }
}
