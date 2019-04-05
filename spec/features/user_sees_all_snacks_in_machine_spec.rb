require 'rails_helper'

RSpec.describe "When a user visits the vending machine show page", type: :feature do
  scenario "they see a list of all the snackes in the machine" do
    sam = Owner.create(name: "Sam's Snacks")
    mix_drink = sam.machines.create(location: "Don's Mixed Drinks")
    snack_1 = mix_drink.snacks.create(name:"snack_1", price: 1.52)
    snack_2 = mix_drink.snacks.create(name:"snack_2", price: 2.53)
    snack_3 = mix_drink.snacks.create(name:"snack_3", price: 3.54)

    visit machine_path(mix_drink)
  
    within "#snack-#{snack_1.id}" do
      expect(page).to have_content("snack_1")
      expect(page).to have_content("$1.52")
    end
    within "#snack-#{snack_2.id}" do
      expect(page).to have_content("snack_2")
      expect(page).to have_content("$2.53")
    end
    within "#snack-#{snack_3.id}" do
      expect(page).to have_content("snack_3")
      expect(page).to have_content("$3.54")
    end

  end
end
