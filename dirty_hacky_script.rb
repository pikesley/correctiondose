require 'xmlsimple'
require 'json'
require 'httparty'
require 'dotenv'
Dotenv.load

data = XmlSimple.xml_in File.read ARGV[0]

r = data['record']
r.sort! { |x, y| x['datetime'] <=> y['datetime'] }

r.each do |datum|
  datum.each_pair do |k, v|
    datum[k] = v[0]
  end
end

url = 'http://localhost:3000/api'

r.each do |j|
  HTTParty.post(
    url,
    body: {
      data: j.to_json
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
