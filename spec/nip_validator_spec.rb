require 'spec_helper'

class NipModel
  include ActiveModel::Validations

  attr_accessor :nip, :nip2

  validates :nip, nip: true, allow_blank: true

  validates_nip_of :nip2, allow_blank: true
end

RSpec.describe NipModel do
  let(:valid) { '123-456-32-18' }

  let(:invalid) { '123-456-32-12' }

  describe 'nip1' do
    context 'with blank attribute' do
      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with valid format' do
      before do
        subject.nip = valid
      end

      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with invalid format' do
      before do
        subject.nip = invalid
      end

      it 'is expected to not be valid' do
        expect(subject).to be_invalid
      end

      it 'is expected to have error message' do
        expect(subject).to be_invalid
        expect(subject.errors.messages[:nip]).to eq([I18n.t('errors.messages.not_a_nip')])
      end
    end
  end

  describe 'nip2' do
    context 'with blank attribute' do
      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with valid format' do
      before do
        subject.nip2 = valid
      end

      it 'is expected to be valid' do
        expect(subject).to be_valid
      end
    end

    context 'with invalid format' do
      before do
        subject.nip2 = invalid
      end

      it 'is expected to not be valid' do
        expect(subject).to be_invalid
      end

      it 'is expected to have error message' do
        expect(subject).to be_invalid
        expect(subject.errors.messages[:nip2]).to eq([I18n.t('errors.messages.not_a_nip')])
      end
    end
  end
end
