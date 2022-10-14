class DevelopersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @developer = Developer.new
    # binding.pry
  end

  def create
    # binding.pry
    @developer = Developer.new(developer_params)
    if @developer.save
      flash[:notice] = "Developer successfully created"
      redirect_to root_path
    else
      flash[:alert] = "something wrong happend"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def developer_param
    params.require(:developer_params).permit(:name, :department_id, :developer_status)
  end
end
