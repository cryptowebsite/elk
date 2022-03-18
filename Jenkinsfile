pipeline {
    agent {
        label 'linux'
    }
    stages {
        stage('checkout playbook'){
            steps{
                dir('elk') {
                    git branch: 'main', credentialsId: '13c50aa8-dc9e-4c1f-96a2-956adf5a594c', url: 'git@github.com:cryptowebsite/elk.git'
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
