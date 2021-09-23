# testしたい内容を記述
require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    
    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }
    
    context "nameカラム"do
      it "空欄でないこと"
    end
  end
end