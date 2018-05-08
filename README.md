# MTN18-ChefDay02

=========================================================================================

vagrant up

OR

kitchen create <name>

kitchen converge <name>

==========================================================================================

yum install git

git clone -b day02 https://github.com/aliaksandr-lahutsin/MTN18-ChefDay02.git

curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v 2.3.4

cd to MTN18-ChefDay02

sudo chef-client -z --runlist "jboss"
