namespace :apt do
  desc 'Clears out the local repository of retrieved package files only removing package files '\
       'that can no longer be downloaded'
  task :autoclean do
    on release_roles :app do |role|
      execute :sudo, 'apt-get', 'autoclean'
    end
  end

  desc 'Check if a reboot is required'
  task :check_reboot do
    on release_roles :app do |role|
      if test('ls /var/run/ | grep reboot-required')
        pkgs = capture(:cat, '/var/run/reboot-required.pkgs').split(/\s/)
        warn "Reboot is required for #{role} to update #{pkgs.join(' ')}"
      end
    end
  end

  desc 'Check for upgradable packages'
  task :check_upgradable do
    on release_roles :app do |role|
      info 'Upgradable packages:'
      execute :apt, 'list', '-qq', '--upgradable'
    end
  end

  desc 'In addition to performing the function of upgrade, also intelligently handles changing '\
       'dependencies with new versions of packages'
  task :distupgrade do
    on release_roles :app do |role|
      execute :sudo, 'apt-get', 'dist-upgrade'
    end
  end

  desc 'Install the newest versions of all packages currently installed on the system'
  task :upgrade do
    on release_roles :app do |role|
      execute :sudo, 'apt-get', 'upgrade'
    end
  end

  desc 'Download package information from all configured sources'
  task :update do
    on release_roles :app do |role|
      execute :sudo, 'apt-get', 'update'
    end
  end
end
