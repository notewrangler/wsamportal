class UsersController < ApplicationController  

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    
      if @user.save
        flash[:notice] = 'user was successfully created.' 
        redirect_to @user
       
      else
         render :new 
       
      end
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def agent_profile
    @user = User.find(params[:id])
  end

  def update
    
      if @user.update(user_params)
        flash[:notice] = 'user was successfully updated.'
        redirect_to @user  
       
      else
         render :edit
        
      end
   
  end

  private

    def user_params
      params.require(:user).permit(:last_name, :first_name, :username, :role, :password,
                                   :password_confirmation, :type, :address, :city, :state, :zip, :phone, :email)
    end
end
