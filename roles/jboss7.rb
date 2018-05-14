name "jboss7"
description "Install and Configure Jboss7 with deploy sample.war"
run_list "recipe[jboss7::default]", "recipe[jboss7::deploy]"
env_run_lists "Chef-dev" => ["recipe[jboss7::default]", "recipe[jboss7::deploy]"], "_default" => ["recipe[jboss7::default]", "recipe[jboss7::deploy]"]
