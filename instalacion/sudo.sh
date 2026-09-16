sudo usermod -aG docker $USER # Agrega usuario al grupo Docker
sudo groupadd docker # Crea el grupo si no está creado
getent group docker
newgrp docker # Reinicia la sesion
ls -l /var/run/docker.sock # Verifica los permisos del socket de Docker

# Si los permisos no son correctos o el grupo no es docker, puedes corregirlos temporalmente con:
# sudo chown root:docker /var/run/docker.sock
# sudo chmod 660 /var/run/docker.sock

sudo systemctl restart docker
