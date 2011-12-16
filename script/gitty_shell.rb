#!/usr/bin/env ruby

require 'syslog'

Syslog.open()

Syslog.info(ARGV[1])

#ENV.each_key do |key|
#  Syslog.info(key + " " + ENV[key])
#end

system(ARGV[1])

Syslog.info('hoge')
