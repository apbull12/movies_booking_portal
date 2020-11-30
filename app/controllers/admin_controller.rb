class AdminController < ApplicationController
  def new
    @admin = Admin.new
  end
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :name, :password, :password_confirmation)
  end
end
