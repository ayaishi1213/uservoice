require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '会員登録' do
    it '全て正しく入力されると登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録ができないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'ageが空だと登録できないこと' do
      @user.age = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Age can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが6文字以上でも英数混合でないと登録できないこと' do
      @user.password = '0000000'
      @user.password_confirmation = "0000000"
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")    
    end

    it 'password_confirmationが空だと登録できない' do
      @user.password = '0000000aa'
      @user.password_confirmation = ""
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")    
    end
  end
end
