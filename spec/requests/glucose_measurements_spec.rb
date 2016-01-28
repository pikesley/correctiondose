describe 'GlucoseMeasurements' do
  describe 'Manage glucose measurements' do
    let(:user) { create :user }

    it 'Adds a measurement and displays the results' do
      visit new_glucose_measurement_url(as: user)
      expect {
        fill_in 'Datetime', with: '2016-01-27 17:53:00'
        fill_in 'Value', with: '5.6'
        click_button 'Create'
      }.to change(GlucoseMeasurement, :count).by 1

      within 'h1' do
        expect(page).to have_content 'Datetime: 2016-01-27 17:53:00'
      end

      within 'h2' do
        expect(page).to have_content '5.6'
      end
    end

    it 'Deletes a measurement' do
      pending
      glucose_measurement = create(:glucose_measurement, datetime: '1992-06-15 12:00:00', value: '7')
      visit glucose_measurements_path(as: user)
      expect {
        click_link 'Edit'
      }.to change(GlucoseMeasurement, :count).by -1
      expect(page).to have_content 'BG measurements'
    end
  end
end
