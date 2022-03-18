pipeline {
    agent {
        label 'linux'
    }
    stages {
        stage('checkout playbook'){
            steps{
                git branch: 'main', credentialsId: 'a9343f9a-4071-476b-b798-7fda404c0e64', url: 'git@github.com:cryptowebsite/elk.git'
                dir('roles/elastic') {
                    git branch: 'bugfix/fix_pipeline', credentialsId: 'a9343f9a-4071-476b-b798-7fda404c0e64', url: 'git@github.com:cryptowebsite/elastic-role.git'
                }

                // dir('roles/filebeat') {
                //     git branch: 'master', credentialsId: 'a9343f9a-4071-476b-b798-7fda404c0e64', url: 'git@github.com:cryptowebsite/filebeat-role.git'
                //     sh 'mv filebeat-role filebeat'
                // }
                // dir('roles/kibana') {
                //     git branch: 'master', credentialsId: 'a9343f9a-4071-476b-b798-7fda404c0e64', url: 'git@github.com:cryptowebsite/kibana-role.git'
                //     sh 'mv kibana-role kibana'
                // }
                // dir('roles/logstash') {
                //     git branch: 'master', credentialsId: 'a9343f9a-4071-476b-b798-7fda404c0e64', url: 'git@github.com:cryptowebsite/logstash-role.git'
                //     sh 'mv logstash-role logstash'
                // }                                                           
            }
        }
        stage('Install requirements') {
            steps{
                // sh 'ansible-galaxy install -r requirements.yml'
                dir('roles/elastic'){
                    sh 'pip3 install -r test-requirements.txt'
                }
                // dir('roles/filebeat'){
                //     sh 'pip3 install -r test-requirements.txt'
                // }
                // dir('roles/kibana'){
                //     sh 'pip3 install -r test-requirements.txt'
                // }
                // dir('elk/roles/logstash'){
                //     sh 'pip3 install -r test-requirements.txt'
                // }
            }
        }
        stage('Run Molecule'){
            steps{
                dir('roles/elastic'){
                    sh 'molecule test'
                }
                // dir('roles/filebeat'){
                //     sh 'molecule test'
                // }
                // dir('roles/kibana'){
                //     sh 'molecule test'
                // }
                // dir('roles/logstash'){
                //     sh 'molecule test'
                // }
            }
        }
    }
}
