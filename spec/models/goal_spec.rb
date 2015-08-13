require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:user) { User.create(username: "sally", uid: '123456', token: '1111', secret:"12345", provider:"fitbot") }
  let(:goal) { Goal.create(steps: 10000, user_id: user.id)}
  let(:profile) { Profile.create(awake_time:"04:00", sleep_time:"21:00", user_id: user.id)}

  before(:each) do
    user
    goal
    profile
  end

  it 'is valid' do
    expect(goal).to be_valid
  end

  it 'is invalid without steps' do
    goal.steps = nil
    expect(goal).to_not be_valid
  end

  it 'belongs to a user' do
    expect(goal.user_id).to eq(user.id)
  end
end
