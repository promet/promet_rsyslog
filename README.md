rsyslog-cookbook 
---------------

Requirements
------------

Usage
-----

Add Some Roles:

Server:
````
name "rsyslog-server"
description "Logwatch config"
run_list(
    "recipe[promet_rsyslog]",
    "recipe[promet_rsyslog::server]"
)

default_attributes(
    :rsyslog => { :server => "true",
                  :log_dir => "/srv/logs",
                  :server_search => "role:rsyslog-server",
                  :"per_host_dir" => "%HOSTNAME%"
      }
)
````
Client:
````
name "rsyslog-client"
description "rsyslog-client config"
run_list(
    "recipe[promet_rsyslog]",
    "recipe[promet_rsyslog::client]"
)

default_attributes(
    :rsyslog => {  :server_search => "role:rsyslog-server",
                   :logs_to_forward => "*" }
)
````


Attributes
---------

Recipes
-------

#### default

#### client

#### server


Author
------

Author:: gregpalmier (<gregpalmier@gmail.com>)
