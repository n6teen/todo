class Todo1 < ApplicationRecord
  validates :title, presence: true
  validates :status, inclusion: { in: [ true, false ] }

  # Broadcast changes to the "todos" stream
  after_create_commit -> { broadcast_append_to "todos", target: "todos-list" }
  after_update_commit -> { broadcast_replace_to "todos" }
  after_destroy_commit -> { broadcast_remove_to "todos" }
end
