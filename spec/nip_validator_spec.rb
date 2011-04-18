require 'spec_helper'
require 'rspec'
require 'active_model'

class BasicNipModel
  include ActiveModel::Validations

  attr_accessor :nip, :nip2

  validates :nip, :presence => true, :nip => true
  
  validates_nip_of :nip2
end

  
  describe "NipValidator" do
    before(:each) do
      @valid_nip = "123-456-32-18"
      @invalid_nip = "123-456-32-12"
      
      @model = BasicNipModel.new

    end

    describe "with nip1" do
      before(:each) do
        @model.nip2 = @valid_nip
      end

      it "should be valid" do
       @model.should_not be_valid 
       @model.nip = @valid_nip
       @model.should be_valid
      end
      
      it "should be invalid" do
        @model.nip = @invalid_nip
        @model.should_not be_valid
      end
    end

    describe "with nip2" do
      before(:each) do
        @model.nip = @valid_nip
      end

      it "should be valid" do
        @model.should be_invalid
        @model.nip2 = @valid_nip
        @model.should be_valid
      end

      it "should be invalid when nil" do
        @model.nip2 = nil
        @model.should be_invalid
      end

      it "should be invalid when empty" do
        @model.nip2 = ""
        @model.should be_invalid
      end

      it "should be invalid when invalid NIP" do
        @model.nip2 = @invalid_nip
        @model.should be_invalid
      end

    end

  end
