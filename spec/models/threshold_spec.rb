require 'rails_helper'

RSpec.describe Threshold, type: :model do
  before do
    FactoryBot.create(:threshold)
  end
  it 'is threshold value correct' do
    expect(Threshold.threshold_latest('ishinomaki')).to eq(16)
  end
end
