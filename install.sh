
echo "deb http://ftp.debian.org/debian/ buster-backports main non-free contrib" >> /etc/apt/sources.list
apt-add-repository non-free
apt-add-repository contrib
apt-get update
apt install apt-transport-https
apt-get install curl

# Google Chrome
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# Visual Studio
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt-get install code

# KVM
apt-get -qq install qemu qemu-kvm qemu-system qemu-utils
apt-get -qq install libvirt-clients libvirt-daemon-system virtinst
systemctl start libvirtd
virsh net-start default
virsh net-autostart default
