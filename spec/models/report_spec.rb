require 'rails_helper'
describe Report do
  before do
    @report = FactoryBot.build(:report)
  end

  describe 'レポート新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'dateとimage、nameとpurpose、outcomeとaction_planが存在すれば登録できる' do
        expect(@report).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'dateが空だと登録できない' do
        @report.date = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("Date can't be blank")
      end
      it 'imageが空だと登録できない' do
        @report.image = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @report.name = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("Name can't be blank")
      end
      it 'purposeが空だと登録できない' do
        @report.purpose = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("Purpose can't be blank")
      end
      it 'outcomeが空だと登録できない' do
        @report.outcome = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("Outcome can't be blank")
      end
      it 'action_planが空だと登録できない' do
        @report.action_plan = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("Action plan can't be blank")
      end
    end
  end
end
