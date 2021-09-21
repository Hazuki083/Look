require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
     # factoriesで作成したダミーデータを使用
    let(:customer) { FactoryBot.create(:customer) }
    let!(:post) { build(:post, customer_id: customer.id) }
     # インスタンス変数の代わりにletを使う
     # test_postを作成し、空欄での登録ができるか確認する
    subject { test_post.valid? }
    let(:test_post) { post }

     context 'reviewカラム' do
      it '空欄でないこと' do
        test_post.review = ''
        is_expected.to eq false;
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