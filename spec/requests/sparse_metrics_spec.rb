describe 'GlycatedHaemoglobin' do
  describe 'Return at least something if the metric is sparse' do
    let(:user) { create :user }

    before :each do
      DatabaseCleaner.clean
    end

    it 'shows the year if the first metric is from last year or even older' do
      create(:glycated_haemoglobin, datetime: '2015-06-06')
      Timecop.freeze 2016, 02, 27 do
        visit glycated_haemoglobins_url(as: user)
        expect(page).to have_content 'June 6th 2015'
      end
    end

  # This happens in the view now
  #  it 'does not show the year if the first metric is from this year' do
  #    create(:glycated_haemoglobin, datetime: '2016-01-01')
  #    Timecop.freeze 2016, 02, 27 do
  #      visit glycated_haemoglobins_url(as: user)
  #      expect(page).to have_content 'January 1st'
  #      expect(page).to have_content 'January 1st 2016'
  #    end
  #  end
  end
end
