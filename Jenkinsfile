node("linux"){
    stage("Git checkout"){
        git credentialsId: '13c50aa8-dc9e-4c1f-96a2-956adf5a594c', url: 'git@github.com:cryptowebsite/elk.git'
    }
    stage("Sample define secret_check"){
        secret_check=true
    }
    stage("Run playbook"){
        if (secret_check){
            sh 'ansible-playbook site.yml -i inventory/prod.yml'
        }
        else{
            echo 'need more action'
        }
        
    }
}