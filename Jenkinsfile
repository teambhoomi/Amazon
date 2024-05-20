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

        stage('sonar'){
            steps{
                withSonarQubeEnv('sonarqube') {
                        sh 'mvn clean package sonar:sonar'
                    }

                }

        }
    }
}