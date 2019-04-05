require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it {should have_many :snack_machines}
    it {should have_many(:snacks).through :snack_machines}
  end

  describe 'instance methods' do
    it '#average_price' do
      @sam = Owner.create(name: "Sam's Snacks")
      @mix_drink = @sam.machines.create(location: "Don's Mixed Drinks")
      @snack_1 = @mix_drink.snacks.create(name:"snack_1", price: 1.52)
      @snack_2 = @mix_drink.snacks.create(name:"snack_2", price: 2.53)
      @snack_3 = @mix_drink.snacks.create(name:"snack_3", price: 3.54)

      expect(@mix_drink.average_price).to eq(2.53)
    end

    it '#num_snacks' do
      @sam = Owner.create(name: "Sam's Snacks")
      @mix_drink = @sam.machines.create(location: "Don's Mixed Drinks")
      @snack_1 = @mix_drink.snacks.create(name:"snack_1", price: 1.52)
      @snack_2 = @mix_drink.snacks.create(name:"snack_2", price: 2.53)
      @snack_3 = @mix_drink.snacks.create(name:"snack_3", price: 3.54)

      expect(@mix_drink.num_snacks).to eq(3)
    end
  end
end
