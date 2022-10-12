class Department < ApplicationRecord
  belongs_to :client_request
  has_many :developers
end
