node {
    def mvnHome
    def appName = 'java-maven-app'
    def dockerImage
    
    stage('Preparation') {
        // Checkout the project from GitHub
        git 'https://github.com/stousif-8/Java-Project.git'
        
        // Define the Maven tool configured in Jenkins
        mvnHome = tool 'M3'
    }

    stage('Build') {
        // Build the project using Maven
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh '"$MVN_HOME/bin/mvn" clean package'
            } else {
                bat(/"%MVN_HOME%\bin\mvn" clean package/)
            }
        }
    }
    
    stage('Docker Build') {
        // Build the Docker image
        dockerImage = docker.build("${appName}:${env.BUILD_ID}")
    }
    
    stage('Docker Run') {
        // Run the Docker container
        sh "docker run -d -p 8080:8080 ${appName}:${env.BUILD_ID}"
    }
    
    stage('Archive') {
        // Archive JAR file as a build artifact
        archiveArtifacts 'target/*.jar'
    }
}
