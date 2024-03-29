require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'name、email、password、password_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationがが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
        it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "emailに@がない場合は登録できないこと " do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordは英字だけでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordに全角文字が含まれている場合は登録できない' do
        @user.password = '00000あ'
        @user.password_confirmation = '00000あ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'family_nameに半角カタカナが含まれている場合は登録できない' do
        @user.family_name = 'ｱｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"        
      end
      it 'first_nameに半角カタカナが含まれている場合は登録できない' do
        @user.first_name = 'ｱｲ'
        @user.valid?
         expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'family_name_kanaに半角カタカナが含まれている場合は登録できない' do
        @user.family_name = 'ｱｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
      it 'first_name_kanaに半角カタカナが含まれている場合は登録できない' do
        @user.first_name = 'ｱｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
    end
  end
end
