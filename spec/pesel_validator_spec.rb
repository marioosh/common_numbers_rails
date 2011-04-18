# encoding: utf-8  
require 'spec_helper'
require 'rspec'
require 'active_model'

class BasicPeselModel
  include ActiveModel::Validations

  attr_accessor :pesel, :pesel2

  validates :pesel, :presence => true, :pesel => true

  validates_pesel_of :pesel2

end

  
  describe "PeselValidator" do
    before(:each) do
      @valid_pesel = "44051401359"
      @invalid_pesel = "44051401353"

      @model = BasicPeselModel.new

    end
    describe "with pesel" do

      before(:each) do
        @model.pesel2 = @valid_pesel
      end

      it "should be valid" do
       @model.should_not be_valid 
       @model.pesel = @valid_pesel
       @model.should be_valid
      end
      
      it "should be invalid" do
        @model.pesel = @invalid_pesel
        @model.should_not be_valid
      end
    end

    describe "with pesel2" do
      before(:each) do
        @model.pesel = @valid_pesel
      end

      it "should be valid" do
        @model.should be_invalid
        @model.pesel2 = @valid_pesel
        @model.should be_valid
      end

      it "should be invalid when nil" do
        @model.pesel2 = nil 
        @model.should be_invalid
      end
      it "should be invalid when empty" do
        @model.pesel2 = "" 
        @model.should be_invalid
      end

      it "should be invalid when invalid number" do
        @model.pesel2 = @invalid_pesel 
        @model.should be_invalid
      end


    end
    

  end

