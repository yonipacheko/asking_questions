class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :body, presence: true
  validates :solved, inclusion: { in: [true, false] }


  def self.unsolved_questionss
    #find(:all, conditions: {solved: false})
    Question.all(conditions: {solved:false})    #(*arg)
  end
end