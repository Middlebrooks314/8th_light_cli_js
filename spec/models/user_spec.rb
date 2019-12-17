require 'spec_helper'
require_relative 'user'

RSpec.describe User do
  let(:attributes) {{
    username: 'Malisa'
}}
  it 'inherits from ActiveRecord::Base' do
    expect(subject.superclass).to eql(ActiveRecord::Base)
  end

  context 'User.new' do
    let(:user) { User.new }
    it 'has a username' do
      subject.username = 'Mal'
      expect(subject.username).to eql('Mal')
    end
  end

  describe '.login_user' do
    it 'find or create user' do
      username = double('username')
      expect(subject.login_user(username)).to eql(subject.new)
    end
  end

  describe '.user_booklist' do
    it 'find books on user booklist' do
      username = double('username')
      expect(subject.user_booklist(username)).to eql(subject.Books)
    end
  end
end
