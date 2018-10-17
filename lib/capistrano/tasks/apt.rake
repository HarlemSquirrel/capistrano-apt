namespace :apt do
  desc 'Check if a reboot is required'
  task :check_reboot do
    on release_roles :app do |role|
      if test('ls /var/run/ | grep reboot-required')
        pkgs = capture(:cat, '/var/run/reboot-required.pkgs').split(/\s/)
        warn "Reboot is required for #{role} to update #{pkgs.join(' ')}"
      end
    end
  end
end
