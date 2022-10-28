class DevelopersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @developer = Developer.new
    @department = Department.find_by(id: params[:id])
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      dept = Department.find(params[:developer][:department_id])
      dept.update!(no_of_resources: dept.no_of_resources - 1)
      # ----------------- changing from new to assigned when all resources has been asssigned------------
      client_request = dept.client_request
      resouce_array = client_request.departments.pluck(:no_of_resources)
      client_request.update!(kanban_column_id: 2) if resouce_array.max.zero?
      #--------------------------------------
      flash[:notice] = 'Developer successfully created'
      redirect_to root_path
    else
      flash[:alert] = 'something wrong happend'
      render :root_path, status: :unprocessable_entity
    end
  end

  private

  def developer_params
    params.require(:developer).permit(:name, :department_id, :developer_status)
  end
end
