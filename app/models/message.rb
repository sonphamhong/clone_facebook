class Message < ActiveRecord::Base
  attr_accessible :body, :user_id, :group_id 
  belongs_to :conversation
  belongs_to :user
  belongs_to :group
  validates_presence_of :body, :user_id
end
