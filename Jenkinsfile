pipeline {
    agent {
        label 'linux'
    }
    stages {
        stage('checkout playbook'){
            steps{
                dir('elk') {
                    git branch: 'main', credentialsId: 'a9343f9a-4071-476b-b798-7fda404c0e64', url: 'git@github.com:cryptowebsite/elk.git'
                }
            }
        }
        stage('Install requirements') {
            steps{
                dir('elk'){
                    sh 'pip3 install ansible-galaxy'
                }
                dir('elk'){
                    sh 'ansible-galaxy install -p roles/ -r requirements.yml'
                }
                dir('elk/roles/elastic'){
                    sh 'pip3 install -r test-requirements.txt'
                }
                dir('elk/roles/filebeat'){
                    sh 'pip3 install -r test-requirements.txt'
                }
                dir('elk/roles/kibana'){
                    sh 'pip3 install -r test-requirements.txt'
                }
                dir('elk/roles/logstash'){
                    sh 'pip3 install -r test-requirements.txt'
                }
            }
        }
        stage('Run Molecule'){
            steps{
                dir('elk/roles/elastic'){
                    sh 'molecule test'
                }
                dir('elk/roles/filebeat'){
                    sh 'molecule test'
                }
                dir('elk/roles/kibana'){
                    sh 'molecule test'
                }
                dir('elk/roles/logstash'){
                    sh 'molecule test'
                }
            }
        }
    }
}
