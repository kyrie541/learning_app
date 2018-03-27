require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'article title must more than 3 character' do
    article = Article.new(title: 'aa', text: 'aaaaaaaaa').save
    expect(article).to eq(false)
  end

  it 'article text must more than 2 character' do
    article = Article.new(title: 'aaaaaaaaa', text: 'a').save
    expect(article).to eq(false)
  end

  it 'article should be able to save' do
    article = Article.new(title: 'aaaaaaaaa', text: 'aaaaaaaaaaa').save
    expect(article).to eq(true)
  end

  it "should have many question" do
    t = Article.reflect_on_association(:comments)
    expect(t.macro).to eq(:has_many)
  end
end


