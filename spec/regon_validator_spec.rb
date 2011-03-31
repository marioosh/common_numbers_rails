require 'spec_helper'
require 'rspec'
require 'active_model'

class BasicRegonModel
  include ActiveModel::Validations

  attr_accessor :regon

  validates :regon, :presence => true, :regon => true
end

  
  describe "RegonValidator" do
    before(:each) do
      @model = BasicRegonModel.new
    end

    it "should be valid" do
     @model.should_not be_valid 
     @model.regon = "192598184"
     @model.should be_valid
    end
    
    it "should be invalid" do
      @model.regon = "192598183"
      @model.should_not be_valid
    end
  end
