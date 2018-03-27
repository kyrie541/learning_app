require 'rails_helper'

RSpec.describe Subsriber, type: :model do
  it 'ensures first name presence' do
    subscriber = Subsriber.new(l_name: 'sample@gmail.com', email: 'password', country: 'Countr1').save
    expect(subscriber).to eq(false)
  end

  it 'ensures last name presence' do
    subscriber = Subsriber.new(f_name: 'sample', email: 'password', country: 'Countr1').save
    expect(subscriber).to eq(false)
  end

  it 'ensures email presence' do
    subscriber = Subsriber.new(f_name: 'sample', l_name: 'sample', country: 'Countr1').save
    expect(subscriber).to eq(false)
  end

  it 'ensures country presence' do
    subscriber = Subsriber.new(f_name: 'sample', l_name: 'sample@gmail.com', email: 'password').save
    expect(subscriber).to eq(false)
  end

  it 'should save successfully' do
    subscriber = Subsriber.new(f_name: 'sample', l_name: 'sample@gmail.com', email: 'password', country: 'Countr1').save
    expect(subscriber).to eq(true)
  end

end

