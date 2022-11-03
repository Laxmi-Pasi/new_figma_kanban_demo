class Department < ApplicationRecord
  belongs_to :client_request
  has_many :developers, dependent: :delete_all
end
