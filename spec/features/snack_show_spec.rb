require 'rails_helper'

RSpec.describe "When a user visits the snack show page", type: :feature do
  before :each do
    @sam = Owner.create(name: "Sam's Snacks")
    @mix_drink = @sam.machines.create(location: "Basement")
    @dons  = @sam.machines.create(location: "Don's Mixed Drinks")

    @snack_1 = @mix_drink.snacks.create(name:"snack_1", price: 1.52)
    @snack_2 = @mix_drink.snacks.create(name:"snack_2", price: 2.54)

    @dons.snacks << @snack_1
  end

  scenario "they see a list of all the machines carrying that snack and avg price at that machine" do

    visit snack_path(@snack_1)

    expect(page).to have_content("snack_1")
    
    within "#machine-#{@mix_drink.id}" do
      expect(page).to have_content("Basement")
      expect(page).to have_content("Average Price: $2.03")
    end

    within "#machine-#{@dons.id}" do
      expect(page).to have_content("Don's Mixed Drinks")
      expect(page).to have_content("Average Price: $1.52")
    end
  end
end
