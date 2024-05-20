pipeline{
    agent any
    tools{
        maven 'maven'
    }
    environment{
        AZURE_CREDENTIALS_ID='azure_principal_id'
    }

    stages{
        stage('clone'){
            steps{
                     git branch : 'master', url: 'https://github.com/teambhoomi/Amazon.git'
            }
        }

        stage('terraform') {
            steps {
                script{

                    azureCredentials = credentials(AZURE_CREDENTIALS_ID) 
                    withCredentials([azureServicePrincipal(credentialsId: AZURE_CREDENTIALS_ID, 
                    subscriptionId: azureCredentials.subscriptionId, clientId: azureCredentials.clientId, 
                    clientSecret: azureCredentials.clientSecret, tenant: azureCredentials.tenant)]) {
                            dir('Terraform') {
                                sh 'echo ==============Terraform version================'
                                sh 'terraform --version'
                                sh 'echo ==============Terraform init=================='
                                sh 'terraform init -reconfigure'
                                sh 'echo ==============Plan=========================='
                                sh 'terraform plan'
                                sh 'echo =================Apply==================='
                                sh 'terraform apply -auto-configure'
                            }
                    }
                     
               
                }         
            }
        }

        // stage('terraform plan') {
        //     steps {
        //         dir('Terraform') {
                    
        //         }
                
        //     }
        // }

        // stage('terraform apply') {
        //     steps {
        //         dir('Terraform') {
        //             sh 'terraform apply -auto-configure'
        //         }
        //     }
        // }

        stage('sonar'){
            steps{
                withSonarQubeEnv('sonarqube') {
                        sh 'mvn clean package sonar:sonar'
                    }

                }

        }
    }
}

