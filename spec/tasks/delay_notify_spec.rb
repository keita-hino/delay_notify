require 'rails_helper'
require 'rake'

describe 'rake task csv' do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'tasks/delay'
    Rake::Task.define_task(:environment)
  end

  before(:each) do
    @rake[task].reenable
  end

  describe 'delay:notify' do
    let(:task) { 'delay:notify' }
    it 'is succeed.' do
      FactoryBot.create(:weather)
      FactoryBot.create(:threshold)
      expect(@rake[task].invoke).to be_truthy
    end
  end
end
