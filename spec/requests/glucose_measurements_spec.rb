describe 'GlucoseMeasurements' do
  describe 'Manage glucose measurements' do
    let(:user) { create :user }

    it 'Adds a measurement and displays the results' do
      visit new_glucose_measurement_url(as: user)
      expect {
        fill_in 'Date and time', with: '2016-01-27 17:53:00'
        fill_in 'Value', with: '5.6'
        click_button 'Create'
      }.to change(GlucoseMeasurement, :count).by 1

      within 'th' do
        expect(page).to have_content 'Wednesday January 27th'
      end
      expect(page).to have_content '17:53'
      expect(page).to have_content '5.6'
    end

    it 'Edit a measurement' do
      glucose_measurement = create(:glucose_measurement, datetime: '1992-06-15 12:00:00', value: '7')
      visit glucose_measurements_path(as: user)
      click_link '12:00'
      expect(page).to have_content 'BG measurement'
    end
  end
end
