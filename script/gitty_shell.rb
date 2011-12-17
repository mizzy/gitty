#!/usr/bin/env ruby

require 'syslog'

Syslog.open()

#Syslog.info(ARGV[1])

#ENV.each_key do |key|
#  Syslog.info(key + " " + ENV[key])
#end

if ARGV[1]
  system(ARGV[1])
else
  system("/bin/bash")
end

#Syslog.info('hoge')

system("cd #{ENV['HOME']}")
system("git add .")
system("git commit -a -m 'commit'")
