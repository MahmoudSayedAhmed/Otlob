class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  after_create_commit { EventBroadcastJob.perform_later self }
end
