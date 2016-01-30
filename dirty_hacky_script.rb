require 'xmlsimple'
require 'json'

data = XmlSimple.xml_in File.read 'spec/support/fixtures/incoming.xml'

r = data['record']
r.sort! { |x, y| x['datetime'] <=> y['datetime'] }

r.each do |datum|
  datum.each_pair do |k, v|
    datum[k] = v[0]
  end
end

puts r
