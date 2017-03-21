class PartiesController < ApplicationController
  def index
    @parties = Array.new

    if !params[:sort].blank?
      order = "#{params[:sort]} #{(params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'}"
      Party.order(order).all.each do |party|
        @parties << party
      end
    else
      order = "start_time #{(params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'}"
      @parties = Party.order(order).all
    end
  end

  def new
    @party = Party.new
    # so the view shows 0 and not blank
    @party.numgsts = 0
  end

  def create
    @party = Party.new
	
	print "create numgsts " + params[:party][:numgsts]
	print  params[:party][:numgsts].blank?
	
    

    @party.attributes = create_params
	
	if params[:party][:numgsts].blank?
		@party.numgsts=0
	end
	
	print "@party.numgsts is " + @party.numgsts.to_s

    if @party.save
      # if end is blank, set to end of day
      if @party.end_time.blank?
        @party.end_time=@party.start_time.end_of_day
        @party.save
      end
      @party.after_save
      redirect_to :action => 'index'
    else
      flash[:notice]="Party was incorrect."
      redirect_to new_party_url
    end
  end
  
  def create_params
  	params.require(:party).permit(:host_name, :host_email, :numgsts, :guest_names, :venue, :location, :theme, :start_time,  :end_time, :descript)
  end
end

