describe 'CarbohydrateIntake' do
  describe 'Manage carb intakes' do
    let(:user) { create :user }

    it 'is cool if there are no datas yet' do
      DatabaseCleaner.clean

      visit carbohydrate_intakes_url(as: user)
      expect(page).to have_content 'Carbs'
      expect(page).to have_link 'Add Carbs', href: '/carbs/new'
    end

    it 'focuses the field correctly' do
      visit new_carbohydrate_intake_url(as: user)

      within ('//label[@for="carbohydrate_intake_weight"]') do
        expect(page).to have_xpath('//input[@autofocus="autofocus"]')
      end

      within ('//label[@for="carbohydrate_intake_description"]') do
        expect(page).to_not have_xpath('.//input[@autofocus="autofocus"]')
      end

      expect(page).to have_xpath('.//input[@autofocus="autofocus"]', count: 1)
    end
  end
end
