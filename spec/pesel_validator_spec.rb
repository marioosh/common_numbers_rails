require 'spec_helper'
require 'rspec'
require 'active_model'

class BasicPeselModel
  include ActiveModel::Validations

  attr_accessor :pesel

  validates :pesel, :presence => true, :pesel => true
end

  
  describe "PeselValidator" do
    before(:each) do
      @model = BasicPeselModel.new
    end

    it "should be valid" do
     @model.should_not be_valid 
     @model.pesel = "44051401359"
     @model.should be_valid
    end
    
    it "should be invalid" do
      @model.pesel = "44051401353"
      @model.should_not be_valid
    end
  end
