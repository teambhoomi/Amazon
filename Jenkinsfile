pipeline{
    agent any
    tools{
        maven 'maven'
    }
    environment{
        AZURE_CREDENTIALS_ID='azure_principal_id'
        WORKSPACE='/var/lib/jenkins/workspace/Amazon-project-org_Amazon_master'
        AZURE_SUBSCRIPTION_ID='85ecb259-68dd-4069-b628-760b0f929578'
        AZURE_TENANT_ID='0e32485b-f068-4281-bb11-a695d4ea0a0d'
        CONTAINER_REGISTRY='projectb8.azurecr.io'
        RESOURCE_GROUP='project'
        REPO="projectb8"
        IMAGE_NAME="imagedemoamazon"
        TAG="1.0"
    }

    stages{
        stage('clone'){
            steps{
                     git branch : 'master', url: 'https://github.com/teambhoomi/Amazon.git'
            }
        }
    

       stage('terraform init') {
           steps{
               script{
                   withCredentials([azureServicePrincipal('azure_principal_id')]) {
                                sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'


                       dir('Terraform'){
                                sh 'terraform --version'
                                sh 'terraform init'
                       }
                               
                     }

               }
           }
       }
        stage('terraform plan') {
            steps {
                script {
                    dir('Terraform'){
                        sh 'terraform plan'
                    }                    
                }
            }
        }
        stage('terraform apply') {
            steps {
                   script{
                    dir('Terraform') {
                         sh 'terraform apply --auto-approve'
                    }
                }
            }
        }

        stage('sonar'){
            steps{
                withSonarQubeEnv('sonarqube') {
                        sh 'mvn clean package sonar:sonar'
                    }

                }

        }
        stage('build') {
            steps{
                sh 'mvn clean install'
            }
        }



        stage('docker build') {
            steps{
                sh "docker build -t myimage ."
             }
         }

        stage('ACR') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'acrnew', passwordVariable: 'AZURE_CLIENT_SECRET', usernameVariable: 'AZURE_CLIENT_ID')]) {
                            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                            sh 'az account set -s $AZURE_SUBSCRIPTION_ID'
                            sh 'az acr login --name $CONTAINER_REGISTRY --resource-group $RESOURCE_GROUP'
			    sh "docker tag myimage projectb8.azurecr.io/imagedemoamazon:1.0"
                            sh "docker push projectb8.azurecr.io/imagedemoamazon:1.0"
                            
                        }
            }
        }

    }
}

