class Question < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true
  validates :solved, inclusion: { in: [true, false] }

end