class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  validates :body, presence: true, length: { in: 2...255 }


  def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
end
