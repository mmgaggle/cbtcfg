#!/bin/bash

sudo apt-get install -y git
wget -O /tmp/chef_11.10.4-1.ubuntu.12.04_amd64.deb 'https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chef_11.10.4-1.ubuntu.12.04_amd64.deb'
sudo dpkg -i /tmp/chef_11.10.4-1.ubuntu.12.04_amd64.deb
sudo mkdir /etc/chef /var/chef-solo
sudo echo <<EOF >> /etc/chef/solo.rb
file_cache_path "/var/chef-solo"
cookbook_path "/var/chef-solo/cookbooks"
EOF
git clone https://github.com/mmgaggle/ceph-solo.git /tmp/ceph-solo.git
sudo ln -s /tmp/ceph-solo.git/cookbooks /var/chef-solo/cookbooks
