require 'xmlsimple'
require 'json'
require 'httparty'
require 'dotenv'
require 'dropbox-api'
require 'dropbox-api/tasks'

module Horrible
  class Hacks
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

    def self.munge download
      data = XmlSimple.xml_in download
      r = data['record']
      r.sort! { |x, y| x['datetime'] <=> y['datetime'] }

      r.each do |datum|
        datum.each_pair do |k, v|
          datum[k] = v[0]
        end.to_json
      end.reverse
    end

    def self.dispatch url
      munge(download).each do |j|
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
