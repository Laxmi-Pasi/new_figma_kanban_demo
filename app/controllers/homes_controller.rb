class HomesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @kanban_columns = KanbanColumn.includes(:client_requests, :departments, :developers).all
    @client_requests = ClientRequest.includes(:departments, :developers).all
    # @sub_tickets_details = SubTicketsPresenter.new(@kanban_columns, @client_requests).client_details
    # binding.pry
  end

  def developer_status_update
    k = KanbanColumn.find_by(id: params['kanban_col_id'])
    d = Developer.find_by(id: params['developer_id'])
    d.update!(developer_status: k.name)

    #------------ changing main ticket status ------------
    c1 = d.department.client_request
    d_s = c1.developers.pluck('developer_status AS f') # []
    if c1.kanban_column.name != 'new_request'
      # binding.pry
      k_id = c1.kanban_column.name_before_type_cast # to get enum values as int
      min_ele = d_s.min # find min element in array
      c1.update!(kanban_column_id: min_ele)
    end

    #-----------------------------------------------------
  end

  def new
    @client_request = ClientRequest.new
    # binding.pry
  end

  def create
    @client_request = ClientRequest.new(request_params)
    if @client_request.save
      flash[:notice] = 'Client successfully created'
      redirect_to root_path
    else
      flash[:alert] = 'something wrong happend'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:client_request).permit(:customer_name, :kanban_column_id)
  end
end
