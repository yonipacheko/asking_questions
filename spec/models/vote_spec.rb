require 'spec_helper'

describe Vote do
  it 'only allows one vote for a given user and a given question/answer' do
    user = User.create!(username: 'ix', password: 'ix')
    question = user.questions.create!(body: 'something', solved: false)
    answer = question.answers.create!(:body => "something")

    v = answer.votes.create!(:user_id => user.id, :vote => true)

    expect(v.user).to eq(user)
    expect(v.voteable_type).to eq('Answer')

    vote2 = answer.votes.new(:user_id => user.id, :vote => false)
    vote2.save
    expect(vote2.errors.full_messages).to eq(['Can not do this'])
  end
end