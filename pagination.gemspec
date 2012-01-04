# encoding: utf-8
require 'rbconfig'
require File.expand_path('../lib/pagination/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'pagination'
  s.version = Pagination::VERSION::STRING

  s.summary = "Pagination plugin for RubyRevealed"
  s.description = "pagination provides a simple API for performing paginated queries in a style gleaned from Avdi Grimm's Objects On Rails'."

  s.authors = ['Adam Dalton']
  s.email = 'adam.dalton@gmail.com'
  s.homepage = 'https://github.com/dalton/pagination/'

  s.rdoc_options = ['--main', 'README.md', '--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE']

  s.files = Dir['Rakefile', '{bin,lib,test,spec}/**/*', 'README*', 'LICENSE*']

  # include only files in version control
  git_dir = File.expand_path('../.git', __FILE__)
  void = defined?(File::NULL) ? File::NULL :
    RbConfig::CONFIG['host_os'] =~ /msdos|mswin|djgpp|mingw/ ? 'NUL' : '/dev/null'

  if File.directory?(git_dir) and system "git --version >>#{void} 2>&1"
    s.files &= `git --git-dir='#{git_dir}' ls-files -z`.split("\0")
  end
end

