#!/bin/bash

# Update your sources
apt-get update

# Install git & ntp
apt-get install -y git ntp

su -c 'git clone https://github.com/openstack-dev/devstack.git' vagrant

cd devstack
git checkout stable/icehouse

cat <<EOF > /home/vagrant/devstack/localrc
SERVICE_HOST=localhost
DATABASE_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_TOKEN=password
SERVICE_PASSWORD=password
ADMIN_PASSWORD=password
API_RATE_LIMIT=False
ENABLED_SERVICES+=,tempest
EOF

sudo chown vagrant.vagrant /home/vagrant/devstack/localrc

su -c 'echo | ./stack.sh' vagrant
