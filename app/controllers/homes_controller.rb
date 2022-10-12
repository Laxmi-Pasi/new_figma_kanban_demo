class HomesController < ApplicationController
  def index
    @kanban_columns  = KanbanColumn.includes(:client_requests).all
  end  
end
