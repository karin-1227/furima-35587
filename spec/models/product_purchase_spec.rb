require 'rails_helper'

RSpec.describe ProductPurchase, type: :model do
  describe '商品の購入' do
    before do
      @product_purchase = FactoryBot.build(:product_purchase)
    end
    context '商品の購入ができる場合' do
      it 'postal_code, prefecture_id, municipality, address, building_name, phone_number, tokenが存在すれば購入できる' do
        expect(@product_purchase).to be_valid
      end
      it 'building_nameは空でも購入ができること' do
        @product_purchase.building_name = ''
        expect(@product_purchase).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it 'postal_codeが空だと購入できないこと' do
        @product_purchase.postal_code = ''
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空だと購入できないこと' do
        @product_purchase.prefecture_id = ''
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと購入できないこと' do
        @product_purchase.municipality = ''
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できないこと' do
        @product_purchase.address = ''
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @product_purchase.phone_number = ''
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "tokenが空では購入できないこと" do
        @product_purchase.token = nil
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeは 3桁の半角数字-4桁の半角数字 の組み合わせでなければ購入できないこと' do
        @product_purchase.postal_code = '1234567'
        @product_purchase.valid?
        expect(@product_purchase.errors.full_messages).to include("Postal code is invalid")
      end
      
    end
  end
end
