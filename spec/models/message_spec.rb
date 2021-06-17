require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe '新規メッセージ投稿' do
    context '新規メッセージ投稿ができる時' do
      it '全ての値が正しく入力できれば、投稿できる' do
        expect(@message).to be_valid
      end

      it 'contentが存在すれば、imageが空でも投稿できる' do
        @message.image = nil
        expect(@message).to be_valid
      end

      it 'imageが存在すれば、contentが空でも投稿できる' do
        @message.content = ''
        expect(@message).to be_valid
      end

    end

    context '新規メッセージ投稿ができない時' do
      it 'contentとimageがどちらも空だと投稿できない' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Contentを入力してください")
      end

      it 'userが紐付いていないと投稿できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Userを入力してください")
      end

      it 'groupが紐付いていないと投稿できない' do
        @message.group = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Groupを入力してください")
      end

    end
  end
end
