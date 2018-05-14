name "proxy_pass"
description "Install nginx and attach app_server"
run_list "recipe[web_server::default]"
env_run_lists "Chef-dev" => ["recipe[web_server::default]"], "_default" => ["recipe[web_server::default]"]
