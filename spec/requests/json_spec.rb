describe 'JSON API' do
  it 'shows JSON' do
    create(:glucose_measurement)
    get '/glucose.json', {hours: 0, format: :json}
  #  json = JSON.parse(response.body)
  end
end
