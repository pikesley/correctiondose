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

    it 'Edits an event' do
      medication_event = create(:medication_event, datetime: '1992-06-15 12:00:00', amount: '7', insulin: 'humalog')
      visit medication_events_path(as: user)
      click_link '12:00'
      expect(page).to have_content 'Meds'
      expect(page).to have_content 'Delete'
    end

    it 'Adds several measurements' do
      DatabaseCleaner.clean

      visit new_medication_event_url(as: user)
      fill_in 'Date and time', with: '2016-02-28 14:00:00'
      fill_in 'Amount', with: '10.5'
      select 'humalog', from: 'Insulin'
      click_button 'Create'

      visit new_medication_event_url(as: user)
      fill_in 'Date and time', with: '2016-02-25 10:00:00'
      fill_in 'Amount', with: '5.5'
      select 'humalog', from: 'Insulin'
      click_button 'Create'

      visit new_medication_event_url(as: user)
      fill_in 'Date and time', with: '2016-02-27 17:00:00'
      fill_in 'Amount', with: '8.0'
      select 'lantus', from: 'Insulin'
      click_button 'Create'

      expect(page).to have_content 'Sunday February 28th'
      expect(page).to have_content '14:00'

      expect(page).to have_content 'Thursday February 25th'
      expect(page).to have_content '10:00'

      expect(page).to have_content 'Saturday February 27th'
      expect(page).to have_content '17:00'

      click_link '14:00'
      expect(page).to have_content 'Meds'
      expect(page).to have_field 'Date and time'
      expect(page).to have_select 'Insulin', options: ['humalog', 'lantus']
      expect(page).to have_selector 'input[type=submit][value="Update Medication event"]'
      expect(page).to have_link 'Delete', href: '/meds/1'
      expect(page).to have_link 'Back', href: '/meds'

      click_link 'Delete'
      expect(MedicationEvent.count).to eq 2
      expect(page).to have_link 'Add new meds', href: 'http://www.example.com/meds/new'
      expect(page).to_not have_content 'Sunday February 28th'
    end
  end
end
