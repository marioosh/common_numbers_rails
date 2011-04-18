require 'spec_helper'
require 'rspec'
require 'active_model'

class BasicRegonModel
  include ActiveModel::Validations

  attr_accessor :regon, :regon2

  validates :regon, :presence => true, :regon => true

  validates_regon_of :regon2
end

  
  describe "RegonValidator" do
    before(:each) do
      @valid_regon = "192598184"
      @invalid_regon = "192598134"

      @model = BasicRegonModel.new
    end

    describe "with regon 1" do
      before(:each) do
        @model.regon2 = @valid_regon
      end
        
      it "should be valid" do
       @model.should_not be_valid 
       @model.regon = @valid_regon
       @model.should be_valid
      end
      
      it "should be invalid" do
        @model.regon = @invalid_regon
        @model.should_not be_valid
      end
    end

    describe "with regon 2" do
      before(:each) do
        @model.regon = @valid_regon
      end

      it "should be valid" do
        @model.should be_invalid
        @model.regon2 = @valid_regon
        @model.should be_valid
      end

      it "should be invalid when nil" do 
        @model.regon2 = nil
        @model.should be_invalid
      end

      it "should be invalid when empty" do
        @model.regon2 == ""
        @model.should be_invalid
      end

      it "should be invalid when invalid regon" do
        @model.regon2 == @invalid_regon
        @model.should be_invalid
      end

    end
  end
