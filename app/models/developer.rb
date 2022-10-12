class Developer < ApplicationRecord
  belongs_to :department
  enum developer_status: { 'new_request' => 0, 'assigned_developer' => 1, 'scheduled_interview' => 2, 'closed' => 3 }
end
