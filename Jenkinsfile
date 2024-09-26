node {
    def mvnHome = tool 'M3'  // Defining Maven home
    def appName = 'java-maven-app'
    
    stage('Preparation') {
        // Checkout the project from GitHub
        git branch: 'main', url: 'https://github.com/stousif-8/Java-Project.git'  // Ensure 'main' is the correct branch name
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
        // Build Docker image, tagging it with 'latest' and using the current directory's Dockerfile
        sh "docker build -t ${appName}:latest ."
    }
    
    stage('Docker Run') {
        // Run the Docker container using the image built in the previous stage
        sh "docker run -d -p 8080:8081 ${appName}:latest"
    }
    
    stage('Archive') {
        // Archive the generated JAR file as a build artifact
        archiveArtifacts 'target/*.jar'
    }
}
