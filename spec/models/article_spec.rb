require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'article title must more than 3 character' do
    question = Article.new(title: 'aa', text: 'aaaaaaaaa').save
    expect(question).to eq(false)
  end

  it 'article text must more than 2 character' do
    question = Article.new(title: 'aaaaaaaaa', text: 'a').save
    expect(question).to eq(false)
  end

  it 'article should be able to save' do
    question = Article.new(title: 'aaaaaaaaa', text: 'aaaaaaaaaaa').save
    expect(question).to eq(true)
  end

  it "should have many question" do
    t = Article.reflect_on_association(:comments)
    expect(t.macro).to eq(:has_many)
  end
end



# describe User do
#   it "should have many teams" do
#     t = User.reflect_on_association(:teams)
#     expect(t.macro).to eq(:has_many)
#   end
# end

# has_many :comments, dependent: :destroy