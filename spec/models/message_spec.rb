require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context '新規投稿できる' do
      it 'imageとcontentが空欄でなければ新規投稿できる' do
        expect(@message).to be_valid
      end

      it 'imageが空欄でなければcontentが空欄でも新規投稿できる' do
        @message.content = ""
        expect(@message).to be_valid        
      end

      it 'contentが空欄でなければimageが空欄でも新規投稿できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end

    context '新規投稿できない' do
      it 'contentもimageも空欄だと新規投稿できない' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end

      it 'roomが紐づいていないと新規投稿できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end

      it 'userが紐づいていないと新規投稿できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end
  end
end
