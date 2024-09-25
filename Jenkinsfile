node {
    def mvnHome = tool 'M3'  // Defining Maven home
    def appName = 'java-maven-app'
    def dockerImage
    
    stage('Preparation') {
        // Checkout the project from GitHub
        git branch: 'main', url: 'https://github.com/stousif-8/Java-Project.git' // Ensure 'main' is the correct branch name
    }
        
    stage('Build') {
        // Build the project using Maven
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh '"$MVN_HOME/bin/mvn" clean package'  // For Unix systems
            } else {
                bat(/"%MVN_HOME%\bin\mvn" clean package/)  // For Windows systems
            }
        }
    }
    
    stage('Docker Build') {
        // Build the Docker image
        dockerImage = docker.build("${appName}:${env.BUILD_ID}")  // Use BUILD_ID to tag the image
    }
    
    stage('Docker Run') {
        // Run the Docker container
        sh "docker run -d -p 8080:8080 ${appName}:${env.BUILD_ID}"  // Run the container, ensure the port is correct
    }
    
    stage('Archive') {
        // Archive JAR file as a build artifact
        archiveArtifacts 'target/*.jar'  // Archive the generated JAR file
    }
}
