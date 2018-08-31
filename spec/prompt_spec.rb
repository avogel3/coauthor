require 'coauthor/prompt'

RSpec.describe Coauthor::Prompt do
  describe '#user_name' do
    it 'captures the user name' do
      allow($stdin).to receive(:gets).twice.and_return('Joe Shmo')
      expect(subject.user_name).to eq 'Joe Shmo'
    end
  end

  describe '#user_email' do
    it 'captures the user email' do
      allow($stdin).to receive(:gets).twice.and_return('user@example.com')
      expect(subject.user_email).to eq 'user@example.com'
    end
  end

  describe '#fetch_user_info' do
    context 'without valid input' do
      it 'returns an empty array' do
        allow($stdin).to receive(:gets).twice.and_return('')
        expect(subject.fetch_user_info).to eq []
      end
    end

    context 'with valid data' do
      it 'returns an array of user details' do
        allow($stdin).to receive(:gets).twice.and_return('Joe Shmo', 'user@example.com')
        expect(subject.fetch_user_info).to eq [{ 'name' => 'Joe Shmo', 'email' => 'user@example.com' }]
      end
    end
  end
end
