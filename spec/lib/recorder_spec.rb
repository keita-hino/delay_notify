require 'rails_helper'

describe Recorder do
  before do
    @recorder = Recorder.new("ishinomaki")
  end

  describe 'current_weather' do
    it 'is current weather date result correct' do
      VCR.use_cassette("lib/get_current_weather") do
        expect(@recorder.current_weather).to have_key("id")
      end
    end
  end

  describe 'five_day_weather' do
    it 'is weather date result correct' do
      VCR.use_cassette("lib/get_five_day_weather") do
        expect(@recorder.five_day_weather[0]).to have_key("dt")
      end
    end
  end

  describe 'return boolean' do
    it "return true" do
      expect(@recorder.falled?(true)).to eq(true)
    end

    it "return false" do
      expect(@recorder.falled?(nil)).to eq(false)
    end
  end
  context 'direction convert' do
    it 'return north' do
      expect(@recorder.direction(0)).to eq("北")
      expect(@recorder.direction(39)).to eq("北")
    end

    it 'return northeast' do
      expect(@recorder.direction(40)).to eq("北東")
      expect(@recorder.direction(89)).to eq("北東")
    end

    it 'return east' do
      expect(@recorder.direction(90)).to eq("東")
      expect(@recorder.direction(139)).to eq("東")
    end

    it 'return southeast' do
      expect(@recorder.direction(140)).to eq("南東")
      expect(@recorder.direction(179)).to eq("南東")
    end

    it 'return south' do
      expect(@recorder.direction(180)).to eq("南")
      expect(@recorder.direction(219)).to eq("南")
    end

    it 'return southwest' do
      expect(@recorder.direction(220)).to eq("南西")
      expect(@recorder.direction(269)).to eq("南西")
    end

    it 'return west' do
      expect(@recorder.direction(270)).to eq("西")
      expect(@recorder.direction(309)).to eq("西")
    end

    it 'return northsouth' do
      expect(@recorder.direction(310)).to eq("北西")
      expect(@recorder.direction(360)).to eq("北西")
    end

  end
end
