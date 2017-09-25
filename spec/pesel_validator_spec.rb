require 'spec_helper'

class PeselModel
  include ActiveModel::Validations

  attr_accessor :pesel, :pesel2

  validates :pesel, pesel: true, allow_blank: true

  validates_pesel_of :pesel2, allow_blank: true
end

RSpec.describe PeselModel do
  let(:valid) { '44051401359' }

  let(:invalid) { '44051401353' }

  describe 'pesel1' do
    context 'with blank attribute' do
      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with valid format' do
      before do
        subject.pesel = valid
      end

      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with invalid format' do
      before do
        subject.pesel = invalid
      end

      it 'is expected to not be valid' do
        expect(subject).to be_invalid
      end

      it 'is expected to have error message' do
        expect(subject).to be_invalid
        expect(subject.errors.messages[:pesel]).to eq([I18n.t('errors.messages.not_a_pesel')])
      end
    end
  end

  describe 'pesel2' do
    context 'with blank attribute' do
      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with valid format' do
      before do
        subject.pesel2 = valid
      end

      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with invalid format' do
      before do
        subject.pesel2 = invalid
      end

      it 'is expected to not be valid' do
        expect(subject).to be_invalid
      end

      it 'is expected to have error message' do
        expect(subject).to be_invalid
        expect(subject.errors.messages[:pesel2]).to eq([I18n.t('errors.messages.not_a_pesel')])
      end
    end
  end
end
