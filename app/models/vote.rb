class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true


  validates :user, uniqueness: {scope: :user_id, message: "User can only vote on this answer one time" }
end
