provider "scaleway" {
  region = "ams1"
}

resource "scaleway_ip" "factorio_server_ip" {}

resource "scaleway_server" "factorio_server" {
  name  = "Factorio Server"
  image = "44d241d1-adf7-4bd7-812a-867d30df9950" # Ubuntu BionicBeaver 2018.04 LTS
  type  = "VC1S"
  public_ip = "${scaleway_ip.factorio_server_ip.ip}"
  
  provisioner "remote-exec" {
    inline = ["apt -y update -qq && apt install -qq -y python-minimal"]
  }
  
  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.public_ip},' playbook.yml" # -u user
    
    environment {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}
