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
<<<<<<< HEAD

  		  @opportunity = Opp.new(opp_params)

=======
  		  @opportunity = Opp.new(opp_params)
  
>>>>>>> cdab4e810dd6dc61f8667973191e9cf1c564fe10
    if @opportunity.save
        redirect_to @opportunity
    else
        render 'new'
    end
  
  end
  
<<<<<<< HEAD

=======
>>>>>>> cdab4e810dd6dc61f8667973191e9cf1c564fe10
  def update
		@opportunity = Opp.find(params[:id])

		if @opportunity.update(opp_params)
			redirect_to @opportunity
		else
			render 'edit'
		end
	end

<<<<<<< HEAD
=======
  
>>>>>>> cdab4e810dd6dc61f8667973191e9cf1c564fe10
  def destroy
  
    @opportunity = Opp.find(params[:id])
    @opportunity.destroy
    redirect_to opps_path
  end
  
  private #method is not publicly accessible to routes
<<<<<<< HEAD

	def opp_params #Purpose of the opp params is for security purposes against hackers these are strong parameters

=======
	def opp_params #Purpose of the opp params is for security purposes against hackers these are strong parameters
>>>>>>> cdab4e810dd6dc61f8667973191e9cf1c564fe10
		params.require(:opportunity).permit(:title, :text)
	end

end
