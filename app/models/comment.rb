class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
    attr_accessible :content, :post_id
    acts_as_likeable
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
end
