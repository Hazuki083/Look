RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
# customer = create(:customer) のようにDB登録やモデルのビルドができ便利