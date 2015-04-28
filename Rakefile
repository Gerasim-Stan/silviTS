#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SilviTS::Application.load_tasks

desc 'Starts watchr'
task :watch do
  system 'bundle exec watchr watchr.rb'
end

tasks = []
Dir.foreach('spec') do |dir|
  next if dir.start_with? '.'
  dir = "spec/#{dir}"
  Dir.foreach(dir) { |file| tasks << "#{dir}/#{file}" unless file.start_with? '.'} if File.directory? dir
end

namespace :tasks do
  tasks.each do |task_number|
    task(task_number) { Rake::Task['tasks:run'].execute(task_number) }
  end

  task :run, :task_id do |t, arg|
    Rake::Task['tasks:spec'].execute arg
  end

  task :spec, :task_id do |t, arg|
    system("bundle exec rspec --fail-fast --color #{arg}") or exit(1)
  end
end

