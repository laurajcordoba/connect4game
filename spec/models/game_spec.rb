require 'rails_helper'

RSpec.describe Game, :type => :model do

  context "Associations" do
    it { should belong_to(:player_one) }
    it { should belong_to(:player_two) }
  end

  context "Validations" do
    it { should validate_presence_of :player_one_id }
    it { should validate_presence_of :player_two_id }
   end

end
