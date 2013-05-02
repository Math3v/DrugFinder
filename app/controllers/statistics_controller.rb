class StatisticsController < ApplicationController

  caches_action :stats, expire: 1.day

  def stats
    @drugs_count          = Statistic.generate_drugs_count
    @suppliers_count      = Statistic.generate_suppliers_count
    @holders_count        = Statistic.generate_holders_count
    @producers_count      = Statistic.generate_producers_count
    @users_count          = Statistic.generate_users_count
    @drugs_usage_count    = Statistic.generate_drugs_with_usage_count
    @drugs_label_count    = Statistic.generate_drugs_with_label_count
  end

  # GET /statistics
  # GET /statistics.json
  def index
    @statistics = Statistic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statistics }
    end
  end

  # GET /statistics/1
  # GET /statistics/1.json
  def show
    @statistic = Statistic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statistic }
    end
  end

  # GET /statistics/new
  # GET /statistics/new.json
  def new
    @statistic = Statistic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statistic }
    end
  end

  # GET /statistics/1/edit
  def edit
    @statistic = Statistic.find(params[:id])
  end

  # POST /statistics
  # POST /statistics.json
  def create
    @statistic = Statistic.new(params[:statistic])

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to @statistic, notice: 'Statistic was successfully created.' }
        format.json { render json: @statistic, status: :created, location: @statistic }
      else
        format.html { render action: "new" }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statistics/1
  # PUT /statistics/1.json
  def update
    @statistic = Statistic.find(params[:id])

    respond_to do |format|
      if @statistic.update_attributes(params[:statistic])
        format.html { redirect_to @statistic, notice: 'Statistic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1
  # DELETE /statistics/1.json
  def destroy
    @statistic = Statistic.find(params[:id])
    @statistic.destroy

    respond_to do |format|
      format.html { redirect_to statistics_url }
      format.json { head :no_content }
    end
  end
end
