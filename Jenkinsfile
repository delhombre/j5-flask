node {
    def app
    printMessage("Pipeline started")
    
    stage('Clone repository') {
      checkout scm
    }

    stage('Build image') {
      app = docker.build("delhombre/j5-flask")
    }

    stage('Push image to Docker Hub') {
      docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
        app.push("latest")
      }
    }

    printMessage("Pipeline finished")
}

def printMessage(message) {
    echo "***************************"
    echo message
    echo "***************************"
}