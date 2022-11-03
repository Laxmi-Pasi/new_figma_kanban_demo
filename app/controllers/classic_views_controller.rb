class ClassicViewsController < ApplicationController
  def index
    @departments = Department.all
    @client_requests = ClientRequest.includes(:departments, :developers).all
    # binding.pry
  end

  # def destroy_multiple
  #   # binding.pry
  #   ClientRequest.destroy(params[:params[:client_request_ids]])
  #   ClientRequest.destroy(params[:department_ids])
  #   ClientRequest.destroy(params[:developer_ids])
  #   respond_to do |format|
  #     format.html { redirect_to classic_view_path }
  #   end
  # end

  def destroy_multiple
    if params[:client_request_ids]
      @client_request = ClientRequest.find_by(id: params[:client_request_ids])
      if @client_request.present?
        @client_request.destroy
        redirect_to classic_view_path
      end
    elsif params[:department_ids]
      @department = Department.find_by(id: params[:department_ids])
      if @department.present?
        @department.destroy
        redirect_to classic_view_path
      end
    else params[:developer_ids]
      # @developer = Developer.find(params[:developer_ids)
      # @developer.destroy
      respond_to do |format|
        format.html { redirect_to classic_view_path }
      end
    end
  end
end
