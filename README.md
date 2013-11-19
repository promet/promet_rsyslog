rsyslog-cookbook 
---------------

The cookbook acts as a wrapper for the Opscode Contrib Cookbook here: https://github.com/opscode-cookbooks/rsyslog

Requirements
------------

* [vagrant](http://downloads.vagrantup.com/) >= 1.2.0
* [berkshelf](http://berkshelf.com/) >= 2.0.0
* [vagrant-berkshelf plugin](https://github.com/RiotGames/vagrant-berkshelf) >= 1.3.3
* [vagrant-omnibus plugin](https://github.com/schisamo/vagrant-omnibus) >= 1.1.0

Usage
-----

Add Some Roles:

Server:
````
name "rsyslog-server"
description "rsyslog-server config"
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
