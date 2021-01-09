require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = FactoryBot.build(:recipe)
    @recipe.image = fixture_file_upload('app/assets/images/sample.jpg')
  end

  describe 'レシピ登録' do

    context 'レシピ登録がうまくいくとき' do
      it 'image、name、person_id、mateial、step1、user_idが存在すれば登録できる' do
        expect(@recipe).to be_valid
      end
    end

    context 'レシピ登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @recipe.name = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Name can't be blank")
      end
      it 'person_idの値が0だと登録できない' do
        @recipe.person_id = '0'
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Person must be other than 0")
      end
      it 'materialが空だと登録できない' do
        @recipe.material = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Material can't be blank")
      end
      it 'step1が空だと登録できない' do
        @recipe.step1 = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Step1 can't be blank")
      end
      it 'userが紐付いていないと登録できない' do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("User must exist")
      end
    end

  end
end

