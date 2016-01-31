load File.expand_path('../../ontrack/importer.rb', __FILE__)

desc 'Import the Ontrack data'
namespace :ontrack do
  task :import do
    Ontrack::Importer.dispatch "#{ENV['host']}/api"
  end
end
