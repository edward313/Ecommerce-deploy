pipeline {

    tools{
    maven ""
    }

    agent any

    stages {

        stage ('build prodject')
        {
            sh "mvn --version"
            sh "java --version"
            sh "mvn clean package -DskipTests"
        }

        stage('Packaging/Pushing imagae') {
            steps{
                sh 'docker build -t edward/springboot .'
            }

        }



        stage('Deploy Spring Boot to DEV') {
            steps {
                echo 'Deploying and cleaning'

                sh 'docker container stop khalid-springboot || echo "this container does not exist" '
                sh 'docker network create dev || echo "this network exists"'
                sh 'echo y | docker container prune '

                sh 'docker container run -d --rm --name edward-springboot -p 8083:8080 --network dev edward/springboot'
            }
        }

    }
    post {
        // Clean after build
        always {
            cleanWs()
        }
    }
}