#!/usr/bin/env ruby
#
# Opens the github page for a repo/branch in your browser.
#
# gh [remote] [branch]
# gh [commitsha]

`git rev-parse 2>/dev/null`
if not $?.success?
  puts 'Not a git repository.'
  exit 1
end

if not ARGV.empty?
  if /commit/ === `git cat-file -t #{ARGV.last}`
    commit = ARGV.pop
  end
end

remote = ARGV[0] || 'origin'
remote_url="remote.#{remote}.url"

giturl = `git config --get #{remote_url}`
if giturl.empty?
  puts "#{remote_url} not set."
  exit 1
end

giturl.chomp!
giturl.gsub! /git@(.*):/, 'https://\1/'
giturl.gsub! /.git$/, ''

branch = ARGV[1] || `git rev-parse --abbrev-ref HEAD 2>/dev/null`
path = `git rev-parse --show-prefix`

if commit
  giturl = "#{giturl}/commit/#{commit}"
elsif not branch.empty?
  giturl = "#{giturl}/tree/#{branch}/#{path}"
end

`open #{giturl}`
