require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe Comment do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'textが存在していれば保存できること' do
      expect(@comment).to be_valid
    end

    it 'commentが空では保存できないこと' do
      @comment.text = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end

    it 'reportが紐付いていないと保存できないこと' do
      @comment.report = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Report must exist')
    end

    it 'userが紐付いていないと保存できないこと' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('User must exist')
    end
  end
end
