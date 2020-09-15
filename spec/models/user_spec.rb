require 'rails_helper'
#RSpec.describe User, type: :model do
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとpasswordとpassword_confirmationとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で登録できる" do
        @user.password = "ab00000"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合で登録できる" do
        @user.password = "ab00000"
        expect(@user).to be_valid
      end
      it "first_nameとlast_nameが全角漢字・ひらがな・カタカナで登録できる" do
        @user.first_name = "阿部"
        @user.last_name = "晋三"
        expect(@user).to be_valid
      end
      it "first_name_kanaとlast_name_kanaが全角カタカナで登録できる" do
        @user.first_name_kana = "アベ"
        @user.last_name_kana = "シンゾウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき'
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@がない場合は登録できない" do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is too short (minimum is 6 characters)", "Password is invalid")
    end
    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "あ００００００"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
    it "passwordが英字のみの場合登録できない" do
      @user.password = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが数字のみの場合登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name Full-width characters")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name Full-width characters")
    end
    it "first_nameが全角漢字・ひらがな・カタカナ出なければ登録できない" do
      @user.first_name = "abcde"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end
    it "last_nameが全角漢字・ひらがな・カタカナ出なければ登録できない" do
      @user.last_name = "fghij"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "first_name_kanaが存在しなければ登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana Full-width katakana characters")
    end
    it "last_name_kanaが存在しなければ登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana Full-width katakana characters")
    end
    it "first_name_kanaが全角カタカナでなければ登録できない" do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end
    it "last_name_kanaが全角カタカナでなければ登録できない" do
      @user.last_name_kana = "かきくけこ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end
    it "birth_dayが存在しなければ登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end