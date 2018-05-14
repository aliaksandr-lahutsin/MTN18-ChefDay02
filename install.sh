#!/bin/bash

rpm -ivh /vagrant/chef-server-core-*.rpm
chef-server-ctl reconfigure
chef-server-ctl user-create admin admin admin admin@mail.com password -f /etc/chef/admin.pem
chef-server-ctl org-create mtn "MTN , Inc" --association_user admin -f /etc/chef/mtn.pem
rpm -ivh /vagrant/chef-manage-*.rpm
chef-manage-ctl reconfigure
