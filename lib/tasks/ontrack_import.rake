load File.expand_path('../../dirty_hacky_mess.rb', __FILE__)

desc 'Import the Ontrack data'
namespace :ontrack do
  task :import do
    dispatch "#{ENV['host']}/api"
  end
end
