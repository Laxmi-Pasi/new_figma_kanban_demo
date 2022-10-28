class Developer < ApplicationRecord
  belongs_to :department
  enum developer_status: { 'new_request' => 1, 'assigned_developer' => 2, 'scheduled_interview' => 3, 'closed' => 4 }
end
