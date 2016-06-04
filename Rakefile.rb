task :default do
  exec "cd /opt/rbenv && git pull"
  exec "cd /opt/rbenv/plugins/ruby-build && git pull"
end
