class Follow < ActiveRecord::Base
    acts_as_follow_store
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
end
