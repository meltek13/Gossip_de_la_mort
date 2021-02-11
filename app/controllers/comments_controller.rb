class CommentsController < ApplicationController
before_action :authenticate_user, only: [:new]

  def index
    @comments = Comment.all
  end

  def show
    @comments = Comment.find(params[:id])
  end

  def new
    @comments = Comment.new
  end

  def create
    @comments = Comment.new(content: params[:content], user: User.last, gossip: Gossip.find(params[:gossip_id]))
    
    if @comments.save
      flash[:notice] = "New comment Save in DB"
      redirect_to Gossip.find(params[:gossip_id])

    else
      puts "$" * 30
      puts "error message"
      puts "$" * 30
      render :new
    end
  end

  def edit
    @comments = Comment.find(params[:id])
    @gossips = Gossip.find(params[:gossip_id])
  end

  def update
    @comments = Comment.find(params[:id])
     post_params = params.require(:comment).permit(:content)
     if @comments.update(post_params)
       redirect_to Gossip.find(params[:gossip_id])
     else
      flash.now[:alert] = "We cannot updated this comments for this reason(s) :"
      render :edit
     end
  end

  def destroy
    
    @comments = Comment.find(params[:id])
    @comments.destroy
    redirect_to Gossip.find(params[:gossip_id])
  end

private 

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end


end
