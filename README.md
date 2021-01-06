# MyDebianSetup

echo "deb http://ftp.debian.org/debian/ buster-backports main non-free contrib" >> /etc/apt/sources.list
apt-add-repository non-free
apt-add-repository contrib
apt-get update

