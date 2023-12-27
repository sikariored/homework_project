class TaskStatus < ApplicationRecord
  has_many :ticket_tasks
end
