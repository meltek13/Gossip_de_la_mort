class GossipsController < ApplicationController
before_action :authenticate_user, only: [:new, :show]


   def index
     @gossips = Gossip.all
     if current_user != nil 
      @name = current_user.first_name.capitalize
     end
   end

   def  show
     @gossips = Gossip.find(params[:id])
   end

   def new
     @gossips = Gossip.new
   end

   def create
     city = City.all.sample

     @gossips = Gossip.new(title: params[:title], content: params[:content], user: User.find_by(id: session[:user_id]))

     if @gossips.save
       flash[:notice] = "New gossip Save in DB"
       redirect_to gossips_path
     else
       puts "$" * 30
       puts "error message"
       puts "$" * 30
       render :new
     end
        
   end

   def like
    @gossips = Gossip.find(params[:id])
    @gossips.liked_by current_user
   end

   def edit
     @gossips = Gossip.find(params[:id])
   end

   def update
     @gossips = Gossip.find(params[:id])
     post_params = params.require(:gossip).permit(:title, :content)
     if @gossips.update(post_params)
         
       redirect_to gossips_path
     else
       render :edit
     end
   
   end

   def destroy
     @gossips = Gossip.find(params[:id])
     @gossips.destroy
     redirect_to gossips_path
   end

   private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end


