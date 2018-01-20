node {
  stage("Main build") {
    checkout scm
    docker.image('chinstrap/overlay-docker').inside('--user root:root') {
      stage("Build") {
        sh '/build.sh -v -d -o chinstrap -p chinstrap:chinstrap/default/linux/amd64 -u https://home.gomersbach.nl/repositories.xml'
      }
    }
    // Clean up workspace
    step([$class: 'WsCleanup'])
  }
}

