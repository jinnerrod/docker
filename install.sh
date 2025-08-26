# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER # Agrega usuario al grupo Docker
sudo groupadd docker # Crea el grupo si no está creado
getent group docker
newgrp docker # Reinicia la sesion
ls -l /var/run/docker.sock # Verifica los permisos del socket de Docker

# Si los permisos no son correctos o el grupo no es docker, puedes corregirlos temporalmente con:
# sudo chown root:docker /var/run/docker.sock
# sudo chmod 660 /var/run/docker.sock

sudo systemctl restart docker
