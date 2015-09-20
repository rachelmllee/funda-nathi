class OppsController < ApplicationController
  def index
    @opportunities = Opp.all
  end
  
  def search
    @opportunities = Opp.search(params[:q])
    render :index
  end
  
  def new 
    @opportunity = Opp.new
  end
  
  def edit
    @opportunity = Opp.find(params[:id])
  end
  
  def show
		 @opportunity = Opp.find(params[:id])
  end

  def create
  		  @opportunity = Opp.new(opp_params)
  
    if @opportunity.save
        redirect_to @opportunity
    else
        render 'new'
    end
  
  end
  
  def update
		@opportunity = Opp.find(params[:id])

		if @opportunity.update(opp_params)
			redirect_to @opportunity
		else
			render 'edit'
		end
	end

  
  def destroy
  
    @opportunity = Opp.find(params[:id])
    @opportunity.destroy
    redirect_to opps_path
  end
  
  private #method is not publicly accessible to routes
	def opp_params #Purpose of the opp params is for security purposes against hackers these are strong parameters
		params.require(:opportunity).permit(:title, :text)
	end

end
