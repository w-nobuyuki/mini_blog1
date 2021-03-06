require 'rails_helper'

RSpec.describe Follow, type: :model do
  it 'はフォロワーとフォローユーザーの組み合わせは重複しないこと' do
    user1 = User.create(name: 'one', password: 'password')
    user2 = User.create(name: 'two', password: 'password')
    user1.follows.create(follow_user_id: user2.id)
    duplicate_follow = user1.follows.new(follow_user_id: user2.id)
    duplicate_follow.valid?
    expect(duplicate_follow.errors[:follow_user_id]).to include 'はすでに存在します'
  end
end
