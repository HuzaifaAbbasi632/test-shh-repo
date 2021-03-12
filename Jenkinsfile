pipeline {
            agent any

            stages {
                stage('Build Docker Image') {
                    steps {
                        sh "docker build . -t mudassarhussain/k8test:v1"
                    }
                }
                stage('Docker Hub Push') {
                    steps {
                        withCredentials([usernamePassword(credentialsId: 'hub', passwordVariable: 'mudassarpass', usernameVariable: 'mudassarid')]) {
                         sh "docker login -u mudassarhussain -p ${mudassarpass}"
                         sh "docker push mudassarhussain/k8test:v1"

                        }
                    }
                }
                        
              stage ('ssh agent')  {  
                   
                          steps {
						  
						  def dockerrun = 'docker run -d -p 8080:8080 mudassarhussain/k8test:v1'
                          sshagent(['server3']) {
			
				  
				  sh 'ssh -o StrictHostKeyChecking=no root@192.168.136.143 ${dockerrun}' 
			  }
				
				  
		        
			 			
				
                          }
                          
              }
                          

         }
		 
		 
		 stage ('ssh agent2')  {  
                          
                          steps {
						   def dockerrun = 'echo "hello"'
                          sshagent(['server4']) {
				   
				 
				  sh 'ssh -o StrictHostKeyChecking=no root@192.168.136.147 ${dockerrun}'
		            
                          }
                          
              }
                          

         }
		 
		 
    }
