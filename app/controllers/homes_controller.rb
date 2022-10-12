class HomesController < ApplicationController
  def index
    @kanban_columns  = KanbanColumn.includes(:client_requests,:departments,:developers).all
    @client_requests  = ClientRequest.includes(:departments,:developers).all
  end  
end
