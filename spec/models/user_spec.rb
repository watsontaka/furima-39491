require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '正常に登録できるとき' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上かつ一致していれば登録できる ' do
        @user.password = @user.password_confirmation
        expect(@user).to be_valid
      end

      it 'first_nameとlast_name両方を入力すれば登録できる' do
        @user.first_name = 'テスト'
        @user.last_name = '太郎'
        expect(@user).to be_valid
      end

      it 'first_katakanaとlast_katakana両方を入力すれば登録できる' do
        @user.first_katakana = 'テスト'
        @user.last_katakana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test456'
        @user.password_confirmation = 'test567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'TEst1234'
        @user.password_confirmation = 'TEst1234'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'パスワードは、数字のみでは登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'パスワードは、英字のみでは登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'first_nameは空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない' do
        @user.first_name = '0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameは空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力がなければ登録できない' do
        @user.last_name = '0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_katakanaは空では登録できない' do
        @user.first_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First katakana can't be blank")
      end

      it 'first_katakanaは全角カタカナでなければ登録できない' do
        @user.first_katakana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First katakana is invalid')
      end

      it 'last_katakanaは空では登録できない' do
        @user.last_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last katakana can't be blank")
      end

      it 'last_katakanaは全角カタカナでなければ登録できない' do
        @user.last_katakana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last katakana is invalid')
      end

      it '生年月日が空では登録できない。' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
