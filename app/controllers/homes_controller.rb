class HomesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @kanban_columns = KanbanColumn.includes(:client_requests, :departments, :developers).all
    @client_requests = ClientRequest.includes(:departments, :developers).all
  end

  def developer_status_update
    k = KanbanColumn.find_by(id: params['kanban_col_id'])
    d = Developer.find_by(id: params['developer_id'])
    d.update!(developer_status: k.name)
    binding.pry
  end
end
