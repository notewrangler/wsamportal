class JobsController < ApplicationController
 
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # before_destroy :confirm


  # load_and_authorize_resource

  # GET /jobs
  # GET /jobs.json
  def index
    case current_user.role
    when 'admin'
      @jobs = Job.order(:start_date).select { |j| j.start_date >= Date.today }
    when 'agent'
      @jobs = Job.order(:start_date).select { |j| !j.agents.include?(current_agent) && j.start_date >= Date.today }
    end 
  end  

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = 'Job was successfully created.'
      redirect_to @job 
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update    
      if @job.update(job_params)
       flash[:success] = 'Job was successfully updated.'  
       redirect_to @job         
      else
         render :edit 
        
    end
  end

  def job_calendar
    @job = Job.find(params[:id])
    @jhook = Jhook.new
    @shifts_by_date = @job.shifts.all.group_by(&:shift_date)
    @date = params[:date] ? Date.parse(params[:date]) : @job.start_date        
  end

  #GET a table displaying upcoming jobs, for agents to select their availability

  def available_jobs
    @jobs = Job.all.select { |j| !j.agents.include?(current_user) && j.start_date >= Date.today }
  end

  # GET calendar display of available shifts with shook radio buttons and link to individual shift selection form
 

  # GET display of Agent availability for complete jobs

  def available_agents
    @job = Job.find(params[:id])
    @jhooks = Jhook.where(job_id: @job.id)
  end



  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
      flash[:success] = 'Job was successfully destroyed.' 
      redirect_to jobs_url  
  end

  # def confirm
  #   data: {confirm: "Are You Sure?"}
  # end

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:job_num, :project, :store_num, :store_name, :address, :city, 
        :state, :zip, :start_date, :end_date, :sat, :sun, :time, :time_text, :timezone, :sched_hrs, :manpower)
    end
end
