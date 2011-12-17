#!/usr/bin/env ruby

require 'rubygems'
require 'grit'

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

repo = Grit::Repo.new(ENV['HOME'])
repo.add('.')
repo.commit_all(message)
