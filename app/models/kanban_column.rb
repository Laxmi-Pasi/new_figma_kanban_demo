class KanbanColumn < ApplicationRecord
  has_many :client_requests
  has_many :departments, through: :client_requests
  has_many :developers, through: :departments
  enum name: { 'new_request' => 0, 'assigned_developer' => 1, 'scheduled_interview' => 2, 'closed' => 3 }
end
