class UsersController < ApplicationController
  
    before_filter :authenticate_user!, :only => [:index, :show]
    
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
      #@lender =Lender.find(params[:user_id])
  end

  def new
    @user = User.new
    @lender = Lender.new
  end

  def create
    @user = User.new(params[:user])
    @lender = @user.lender.build(params[:lender])
    if @user.save
      flash[:notice] = "Successfully signed up as a Seeds lender!"
      redirect_to :action => 'show'
    else
      render :action => 'new'
    end
  end
    
  def byEmail
      @user = User.find(params[:email])
      
      respond_to do |format|
          format.html 
          format.json { render json: @user }
      end 
  end
 
  def byAuthToken
      @user = User.find(:first, :conditions => ["authentication_token = ?", params[:authentication_token]])
      
      respond_to do |format|
          format.html
          format.json { render json: @user }
      end
  end
  
end