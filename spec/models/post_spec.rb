require 'rails_helper'

RSpec.describe Post, type :model do
  context 'Associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user).macro
      expect(association).to eq :belongs_to
    end

    it 'belongs to category' do
      association = describe_class.reflect_on_association(:broth).macro
      expect(association).to eq :belongs_to
    end
  end
end