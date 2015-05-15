class Like < ActiveRecord::Base
    acts_as_like_store
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
end
