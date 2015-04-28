watch(%r{spec/(\w+/\w+).rb}) do |dir|
  system "clear"
  system "bundle exec rake tasks:#{dir[0]}"
end

