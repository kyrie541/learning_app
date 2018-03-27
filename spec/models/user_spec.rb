require 'rails_helper'

RSpec.describe User, type: :model do
  it 'ensures username presence' do
    user = User.new(email: 'sample@gmail.com', password_digest: 'password').save
    expect(user).to eq(false)
  end

  it 'ensures email presence' do
    user = User.new(userid: 'sample', password_digest: 'password').save
    expect(user).to eq(false)
  end

  it 'ensures password presence' do
    user = User.new(userid: 'sample', email: 'sample@gmail.com').save
    expect(user).to eq(false)
  end

  it 'should save successfully' do
    user = User.new(userid: 'sample', email: 'sample@gmail.com', password_digest: 'password').save
    expect(user).to eq(true)
  end


  it 'email must be unique' do
    user1 = User.new(userid: 'ample', email: 'sample@gmail.com', password_digest: 'password').save
    user2 = User.new(userid: 'sample', email: 'sample@gmail.com', password_digest: 'password').save
    expect(user2).to eq(false)
  end

  it 'username must be unique' do
    user1 = User.new(userid: 'sample', email: 'ample@gmail.com', password_digest: 'password').save
    user2 = User.new(userid: 'sample', email: 'sample@gmail.com', password_digest: 'password').save
    expect(user2).to eq(false)
  end
end