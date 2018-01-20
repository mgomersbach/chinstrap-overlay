node {
    // Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
            checkout scm
        }
        stage ('Tests') {
            parallel 'repoman': {
                sh "repoman -d -e y --mode full"
            }
        }
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}

