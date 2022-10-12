class ClientRequest < ApplicationRecord
  belongs_to :kanban_column
  has_many :departments
  has_many :developers, through: :departments
end
