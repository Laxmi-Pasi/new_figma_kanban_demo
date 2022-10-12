class ClientRequest < ApplicationRecord
  belongs_to :kanban_column
  has_many :departments
end
