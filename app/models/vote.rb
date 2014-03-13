class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validate :only_one_vote


  def only_one_vote
    count = Vote.where("user_id = ? AND voteable_id = ? AND voteable_type = ?", self.user_id, self.voteable_id, self.voteable_type).count
    if count == 0
      true
    else
      self.errors.add(:base, "Can not do this")
      false
    end
  end

end
