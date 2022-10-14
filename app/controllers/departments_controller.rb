class DepartmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @department = Department.new
    # binding.pry
  end

  def create
    # binding.pry
    @department = Department.new(department_param)
    if @department.save
      flash[:notice] = "Department successfully created"
      redirect_to root_path
    else
      flash[:alert] = "something wrong happend"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def department_param
    params.require(:department).permit(:name, :client_request_id, :no_of_resources)
  end
end
