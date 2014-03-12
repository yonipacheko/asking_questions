class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true


  validates :user, uniqueness: {scope: :user, message: "User can only vote on this answer one time" }
end