require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  it "全て入力されていると投稿できる" do
    expect(@post).to be_valid
  end

  it 'item名が空だと投稿できない' do
    @post.item = ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Item can't be blank")
  end

  it 'contentが空だと投稿できない' do
    @post.content = ""
    @post.valid?
    expect(@post.errors.full_messages).to include("Content can't be blank")
  end

  it 'imageが空だと投稿できない' do
    @post.image = nil
    @post.valid?
    expect(@post.errors.full_messages).to include("Image can't be blank")
  end

  it 'userに紐づいていないと投稿できない' do
    @post.user = nil
    @post.valid?
    expect(@post.errors.full_messages).to include("User must exist")
  end
end
