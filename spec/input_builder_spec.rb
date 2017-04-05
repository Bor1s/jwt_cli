require "spec_helper"
require 'pry'

RSpec.describe JwtCli::InputBuilder, type: :lib do
  describe '#add_email!' do
    context 'prompts user to enter email value' do
      context 'when correct' do
        it 'saves email value' do
          expect(subject).to receive(:ask).with("Enter EMAIL:").and_return('frodo@gmail.com')
          subject.add_email!
        end
      end

      context 'when incorrect' do
        it 'raises InvalidEmailError' do
          allow(subject).to receive(:ask).with("Enter EMAIL:").and_return('bad_email_format_string')
          expect { subject.add_email! }.to raise_error(JwtCli::InputBuilder::InvalidEmailError)
        end
      end
    end
  end

  describe '#add_user_id' do
    it 'prompts user to enter user_id value' do
      expect(subject).to receive(:ask).with("Enter USER_ID:").and_return(123)
      subject.add_user_id
    end
  end

  describe '#add_additional_information' do
    context 'when key is new' do
      it 'prompts user to enter additional key/value pairs' do
        allow(subject).to receive(:ask).with("Enter key:").and_return('foo')
        expect(subject).to receive(:ask).with("Enter value for foo:").and_return('bar')

        subject.add_additional_information
      end
    end

    context 'when key already exists' do
      it 'notifies user' do
        subject.instance_variable_set(:@storage, {'foo' => 'bar'})
        allow(subject).to receive(:ask).with("Enter key:").and_return('foo')
        expect(subject).to receive(:say).with("You have already enetered key foo. Please choose another one.")

        subject.add_additional_information
      end
    end
  end

  describe '#build' do
    it 'returns hash' do
      expect(subject.build).to eq({})
    end
  end
end
