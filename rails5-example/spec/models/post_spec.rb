require 'rails_helper'

RSpec.describe Post do

  it 'finds posts by created at or featured' do
    post = Post.create!(title: 'sample post', contents: 'this is not a joke')
    found = Post.by_created_at_or_featured.first
    expect(post).to eq(found)
  end

  it 'stores tags correctly in the database' do
    post = Post.create!(title: 'sample post', contents: 'this is not a joke', tags: 'this, is, some, tag')
    expect(post.tags).to eq(['this', 'is', 'some', 'tag'])
  end

  it 'accepts it as it is if an array' do
    post = Post.create!(title: 'sample post', contents: 'this is not a joke', tags: [1, '20', 10.9, 'me'])
    expect(post.tags).to eq(['1', '20', '10.9', 'me'])
  end

end