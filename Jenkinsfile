
pipeline{
    agent any
    tools{
        maven 'maven'
        terraform 'terraform40516'
    }

    environment{
        AZURE_CREDENTIALS = credentials('azure_principal_id')
        

    }

    stages{
        stage('clone'){
            steps{
                     git branch : 'master', url: 'https://github.com/teambhoomi/Amazon.git'
            }
        }

        stage('azure deploy') {
            steps {

                script{
                    azureLogin(servicePrincipalId: "${AZURE_CREDENTIALS.clientId}",
                                servicePrincipalKey: "${AZURE_CREDENTIALS.clientSecret}",
                                tenantId: "${AZURE_CREDENTIALS.tenantId}",
                                subscriptionId: "${AZURE_CREDENTIALS.subscriptionId}")
                    sh 'az group create --name project --location North Europe'
                    
                }
                
            }
        }
        stage('terraform init') {
            steps{
                script{
                    dir('Terraform') {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage

        stage('terraform plan') {
            steps {
                script{
                    dir('Terraform'){
                        sh 'terraform plan'
                    }
                    
                }
                
            }
        }

        stage('terraform apply') {
            steps {
                script{
                    dir('Terraform'){
                        sh 'terraform apply -auto-approve'
                    }
                }
                sh 'terraform apply -auto-configure'
            }
        }

        stage('sonar'){
            steps{
                withSonarQubeEnv('sonarqube') {
                        sh 'mvn clean package sonar:sonar'
                    }

                }

        }
    }
}

