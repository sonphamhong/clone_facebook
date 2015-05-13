# enable strong parameters for all active record resources
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)