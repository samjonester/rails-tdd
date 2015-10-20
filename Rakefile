# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :install do
  Bundler.with_clean_env do
    sh "bundle install --without production"
  end
	Rake::Task[:travis].invoke
end

task :travis do
	Rake::Task['db:migrate'].invoke
	Rake::Task[:spec].invoke
	Rake::Task[:cucumber].invoke
end
