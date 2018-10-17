# capistrano-apt
Aptitude utilities for Capistrano

## Install

    gem install capistrano-apt

## Require in Capfile

```ruby
# Capfile
# ...
require 'capistrano/apt'
# ...
```

## Tasks

```
➤  cap --tasks
cap apt:autoclean                  # Clears out the local repository of retrieved package files only removing package files that can no...
cap apt:check_reboot               # Check if a reboot is required
cap apt:check_upgradable           # Check for upgradable packages
cap apt:distupgrade                # In addition to performing the function of upgrade, also intelligently handles changing dependencie...
cap apt:update                     # Download package information from all configured sources
cap apt:upgrade                    # Install the newest versions of all packages currently installed on the system
```

## Sudo without password

Add the following to the sudoers file using `sudo visudo` on the server replacing `rails` with the user used to deploy the application.

```
# Allow rails user to install and upgrade packages without a password
rails   ALL=NOPASSWD: /usr/bin/apt-get autoclean
rails   ALL=NOPASSWD: /usr/bin/apt-get dist-upgrade
rails   ALL=NOPASSWD: /usr/bin/apt-get install
rails   ALL=NOPASSWD: /usr/bin/apt-get update
rails   ALL=NOPASSWD: /usr/bin/apt-get upgrade
```
