require 'xmlsimple'
require 'json'
require 'httparty'
require 'dotenv'
require 'dropbox-api'
require 'dropbox-api/tasks'

module Ontrack
  class Importer
    def self.foo
      'FOO'
    end

    def self.dropbox_client
      Dotenv.load
      Dropbox::API::Config.mode       = 'dropbox'
      Dropbox::API::Config.app_key    = ENV['DROPBOX_APP_KEY']
      Dropbox::API::Config.app_secret = ENV['DROPBOX_APP_SECRET']
      Dropbox::API::Client.new(:token => ENV['DROPBOX_TOKEN'], :secret => ENV['DROPBOX_SECRET'])
    end

    def self.download
      dropbox_client.download dropbox_client.ls('ontrack').sort { |x, y| x[:revision] <=> y[:revision] }[-1].path
    end

    def self.arrayify xml
      XmlSimple.xml_in(xml)['record'].sort do |x, y|
        y['datetime'] <=> x['datetime']
      end
    end

    def self.fix_weirdness weird
      weird.each_pair do |key, list|
        weird[key] = list.first
      end
    end

    def self.make_json download
      r = arrayify download
      r.each do |datum|
        fix_weirdness(datum).to_json
      end
    end

    def self.dispatch url
      make_json(download).each do |j|
        puts "sending #{j}"
        HTTParty.post(
          url,
          body: {
            data: j
          }.to_json,
          headers: {
            'Content-Type' => 'application/json'
          },
          basic_auth: {
            username: ENV['API_USER'],
            password: ENV['API_PASSWORD']
          }
        )
      end
    end
  end
end
