describe 'MedicationEvents' do
  describe 'Manage medication events' do
    let(:user) { create :user }

    it 'Adds an event and displays the results' do
      visit new_medication_event_url(as: user)
      expect {
        fill_in 'Date and time', with: '2016-01-27 18:53:00'
        fill_in 'Amount', with: '10.0'
        select 'humalog', from: 'Insulin'
        click_button 'Create'
      }.to change(MedicationEvent, :count).by 1

      within 'th' do
        expect(page).to have_content 'Wednesday January 27th'
      end
      expect(page).to have_content '18:53'
      expect(page).to have_content '10.0'
      expect(page).to have_content 'humalog'
    end

    it 'Edit an event' do
      medication_event = create(:medication_event, datetime: '1992-06-15 12:00:00', amount: '7', insulin: 'humalog')
      visit medication_events_path(as: user)
      click_link '12:00'
      expect(page).to have_content 'Meds'
      expect(page).to have_content 'Delete'
    end
  end
end
