require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
     # factoriesで作成したダミーデータを使用
    let(:customer) { FactoryBot.create(:customer) }
    let!(:post) { build(:post, customer_id: customer.id) }
    
     # test_postを作成し、空欄での登録ができるか確認する
    subject { test_post.valid? }
    let(:test_post) { post }
     context 'reviewカラム' do
      it '空欄でないこと' do
        test_post.title = ''
        is_expected.to eq false;
      end
       it '200文字以下であること: 200文字は〇' do
        post.review = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        post.review = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end