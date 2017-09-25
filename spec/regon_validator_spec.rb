require 'spec_helper'

class RegonModel
  include ActiveModel::Validations

  attr_accessor :regon, :regon2

  validates :regon, regon: true, allow_blank: true

  validates_regon_of :regon2, allow_blank: true
end

RSpec.describe RegonModel do
  let(:valid) { '192598184' }

  let(:invalid) { '192598134' }

  describe 'regon1' do
    context 'with blank attribute' do
      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with valid format' do
      before do
        subject.regon = valid
      end

      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with invalid format' do
      before do
        subject.regon = invalid
      end

      it 'is expected to not be valid' do
        expect(subject).to be_invalid
      end

      it 'is expected to have error message' do
        expect(subject).to be_invalid
        expect(subject.errors.messages[:regon]).to eq([I18n.t('errors.messages.not_a_regon')])
      end
    end
  end

  describe 'regon2' do
    context 'with blank attribute' do
      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with valid format' do
      before do
        subject.regon2 = valid
      end

      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with invalid format' do
      before do
        subject.regon2 = invalid
      end

      it 'is expected to not be valid' do
        expect(subject).to be_invalid
      end

      it 'is expected to have error message' do
        expect(subject).to be_invalid
        expect(subject.errors.messages[:regon2]).to eq([I18n.t('errors.messages.not_a_regon')])
      end
    end
  end
end
