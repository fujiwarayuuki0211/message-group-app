require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.create(:user, nickname: 'test2')
    @group = FactoryBot.build(:group, user_ids: [ user.id, another_user.id ] )
  end

  describe '新規グループ作成' do
    context '新規グループ作成できる時' do
      it '全ての値が正しく入力できれば、作成できる' do
        expect(@group).to be_valid
      end

    end

    context '新規グループ作成できない時' do
      it 'nameが空だと作成できない' do
        @group.name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("メッセージグループ名を入力してください")
      end

      it 'imageが空だと作成できない' do
        @group.image = nil
        @group.valid?
        expect(@group.errors.full_messages).to include("画像を入力してください")
      end

      it 'category_idが1だと作成できない' do
        @group.category_id = 1
        @group.valid?
        expect(@group.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'user_idsが一つだと作成できない' do
        user = FactoryBot.create(:user)
        @group.user_ids = [user.id]
        @group.valid?
        expect(@group.errors.full_messages).to include("メンバーを1人以上選択してください")
      end

    end
  end
end
