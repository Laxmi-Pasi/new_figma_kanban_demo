class KanbanColumn < ApplicationRecord
  has_many :client_requests
  has_many :departments, through: :client_requests
  has_many :developers, through: :departments
  enum name: { 'new_request' => 1, 'assigned_developer' => 2, 'scheduled_interview' => 3, 'closed' => 4 }
end
