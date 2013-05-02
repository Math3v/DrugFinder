class DrugsController < ApplicationController

  def wide_search
    if params[:q].nil? then alert[:error] = 'Cannot be empty'  end
    # Original
    #drug_ = Drug.find_drugs_like(params[:q])
    #@drug = drug_.paginate(page: params[:page])

    # PG_Search
    #drug_ = Drug.includes(:supplier, :holder, :producer).search_by_more_attr(params[:q])
    #@drug = drug_.paginate(page: params[:page])

    # Texticle
    drug_ = Drug.search_by_more_attr_texticle(params[:q]).includes(:supplier, :holder, :producer)
    @drug = drug_.paginate(page: params[:page])

    @param = params[:q]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drug }
    end

    return @drug, @param
  end

  def body_clicked_search
    drug_ =  Drug.includes(:supplier, :holder, :producer).find_drugs_by_clicks(params[:q])
    @drug = drug_.paginate(page: params[:page])  if !drug_.nil?

    @param = ''

    respond_to do |format|
      format.html
      format.json {render json: @drug}
    end
    return @drug, @param
  end

  # GET /search
  def search
    if params[:q].nil? then alert[:error] = 'Cannot be empty'  end
    drug_ = Drug.find_drugs_like_name params[:q]
    @drug = drug_.paginate(page: params[:page])
    @param = params[:q]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drug }
    end

    return @drug, @param
  end

  # GET /find
  def find
    drug_name = Drug.find_drugs_like_name params[:name]
    @drug = drug_name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drug }
    end
  end

  # GET /drugs
  # GET /drugs.json
  def index
    @drug = Drug.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drugs }
    end
  end

  # GET /drugs/1
  # GET /drugs/1.json
  def show
    @drug = Drug.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @drug }
      end
  end

  # GET /drugs/new
  # GET /drugs/new.json
  def new
    @drug = Drug.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drug }
    end
  end

  # GET /drugs/1/edit
  def edit
    @drug = Drug.find(params[:id])
  end

  # POST /drugs
  # POST /drugs.json
  def create
    @drug = Drug.new(params[:drug])

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
        format.json { render json: @drug, status: :created, location: @drug }
      else
        format.html { render action: "new" }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drugs/1
  # PUT /drugs/1.json
  def update
    @drug = Drug.find(params[:id])

    respond_to do |format|
      if @drug.update_attributes(params[:drug])
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug = Drug.find(params[:id])
    @drug.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
