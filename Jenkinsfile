pipeline {
    agent any

    stages {
        stage('Setup Python Virtual ENV') {
            steps {
                script {
                    dir('/root/frs_cicd') {
                        if (!fileExists('CICD2')) {
                            sh 'mkdir CICD2'
                        }
                        if (!fileExists('CICD2Env')) {
                            sh 'python3 -m venv CICD2Env'
                        }                       
                    } 
                }              

            }
        }

        stage('Checkout') {
            steps {
                script {
                        dir('/root/frs_cicd/CICD2') {
                            git branch: 'main', url: 'https://github.com/WencesKipsang/Django-cicd.git' 
                        }                     
                }              

            }
        }
        
        stage('Build') {
            steps {
                echo "Building"
                script {
                    dir('/root/frs_cicd') {
                        sh '''
                        . CICD2Env/bin/activate
                        echo "Virtual environment activated"
                        cd /root/frs_cicd/CICD2
                        pip install -r requirements.txt
                        python manage.py makemigrations
                        python manage.py migrate
                        '''
                    } 
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo "seting up gunicorn"
                script {
                    dir('/root/frs_cicd/CICD2') {
                    sh '''
                    chmod +x  gunicorn.sh
                    ./gunicorn.sh
                    '''                    
                    }
                }
            }
        }
        
        stage('Release') {
            steps {
                echo "Releasing"
            }
        }
    }
    post {
        success {
            echo "Build successful"
            // You can add additional steps here, like running tests or notifications.
        }

        failure {
            echo "Build failed"
        }
    }
}