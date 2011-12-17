#!/usr/bin/env ruby

require 'syslog'

Syslog.open()

if ARGV[1]
  system(ARGV[1])
else
  system("/bin/bash")
end

message = "Updated."
message_file = "#{ENV['HOME']}/.message"
if File.exist?(message_file)
  message = File.read(message_file)
  File.delete(message_file)
end

system("cd #{ENV['HOME']}")
system("git add .")
system("git commit -a -m '#{message}'")
