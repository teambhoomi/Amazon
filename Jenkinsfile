pipeline{
    agent any
    tools{
        maven 'maven'
    }

    stages{
        stage('clone'){
            steps{
                     git branch : 'master', url: 'https://github.com/teambhoomi/Amazon.git'
            }
        }

        stage('terraform init') {
            steps {
                sh 'terraform --version'
                sh 'terraform init'
            }
        }

        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('terraform apply') {
            steps {
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