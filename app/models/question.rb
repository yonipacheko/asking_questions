class Question < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true
  validates :solved, inclusion: { in: [true, false] }

  def self.unsolved_questions(params)
    where("#{params[:solved]} LIKE ?", "false")
  end

end