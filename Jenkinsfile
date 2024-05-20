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
           steps{
               script{
                   withCredentials([azureServicePrincipal('azure_principal_id')]) {
                                sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
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

