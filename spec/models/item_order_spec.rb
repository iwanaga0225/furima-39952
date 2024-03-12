require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
    before do
      user =  FactoryBot.create(:user)
      item =  FactoryBot.create(:item)
      @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
    end
  describe '購入者情報の保存' do
    context '商品購入が出来る場合' do
      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_order).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @item_order.building = ''
        expect(@item_order).to be_valid
      end
    end

    context '商品購入が出来ない場合' do
      it 'token(クレジットカード情報)が空だと購入ができない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @item_order.postal_code = ""
        @item_order.valid?
        expect(@item_order.errors.messages).to include({:postal_code => ["can't be blank", "is invalid"]})
      end
      it '郵便番号にハイフンがないと登録できない' do
        @item_order.postal_code = "12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が8桁でないと購入できない' do
        @item_order.postal_code = "123-458"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'delivery_area_idが空だと購入できない' do
        @item_order.delivery_area_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'cityが空だと購入できない' do
        @item_order.city = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと購入できない' do
        @item_order.street = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空だと購入できない' do
        @item_order.phone = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone can't be blank")
        end
      it 'phoneが9桁以下だと購入できない' do
        @item_order.phone = "080123456"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが12桁以上だと購入できない' do
        @item_order.phone = "080123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneは全角数字だと購入できない' do
        @item_order.phone = "０１２３４５６７８９"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneは半角英字だと購入できない' do
        @item_order.phone = "testtestte"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneは半角英数字混合だと購入できない' do
        @item_order.phone = "testtest12"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone is invalid")
      end
      it 'userが紐付いていないと購入できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end