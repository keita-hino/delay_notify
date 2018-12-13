require 'rails_helper'

describe Recorder do
  before do
    @recorder = Recorder.new("ishinomaki")
  end

  describe 'return boolean' do
    it "return true" do
      expect(@recorder.falled?(true)).to eq(true)
    end

    it "return false" do
      expect(@recorder.falled?(nil)).to eq(false)
    end

  end
  describe 'direction convert' do
    it 'direction convert to north' do
      expect(@recorder.direction(0)).to eq("北")
      expect(@recorder.direction(39)).to eq("北")
    end

    it 'direction convert to northeast' do
      expect(@recorder.direction(40)).to eq("北東")
      expect(@recorder.direction(89)).to eq("北東")
    end

    it 'direction convert to east' do
      expect(@recorder.direction(90)).to eq("東")
      expect(@recorder.direction(139)).to eq("東")
    end

    it 'direction convert to southeast' do
      expect(@recorder.direction(140)).to eq("南東")
      expect(@recorder.direction(179)).to eq("南東")
    end

    it 'direction convert to south' do
      expect(@recorder.direction(180)).to eq("南")
      expect(@recorder.direction(219)).to eq("南")
    end

    it 'direction convert to southwest' do
      expect(@recorder.direction(220)).to eq("南西")
      expect(@recorder.direction(269)).to eq("南西")
    end

    it 'direction convert to west' do
      expect(@recorder.direction(270)).to eq("西")
      expect(@recorder.direction(309)).to eq("西")
    end

    it 'direction convert to northsouth' do
      expect(@recorder.direction(310)).to eq("北西")
      expect(@recorder.direction(360)).to eq("北西")
    end

  end
end
