require 'spec_helper'
require 'rspec'
require 'active_model'

class BasicModel
  include ActiveModel::Validations

  attr_accessor :nip

  validates :nip, :presence => true, :nip => true
end

  
  describe "NipValidator" do
    before(:each) do
      @model = BasicModel.new
    end

    it "empty should be invalid" do
     @model.should_not be_valid 
     @model.nip = "123-456-32-18"
     @model.should be_valid
    end

  end