describe 'CarbohydrateIntake' do
  describe 'Manage carb intakes' do
    let(:user) { create :user }

    it 'is cool if there are no datas yet' do
      DatabaseCleaner.clean

      visit carbohydrate_intakes_url(as: user)
      expect(page).to have_content 'Carbs'
      expect(page).to have_link 'Add carbs', href: '/carbs/new'
    end
  end
end
