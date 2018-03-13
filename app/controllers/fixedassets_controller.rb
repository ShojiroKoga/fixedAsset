class FixedassetsController < ApplicationController
  before_action :set_fixedasset, only: [:show, :edit, :update, :destroy]

  # GET /fixedassets
  # GET /fixedassets.json
  def index
    @fixedassets = Fixedasset.all
    

    @q = Fixedasset.search(params[:q])
    @fixedassets = @q.result(distinct: true)


  if params[:pdf]
   render pdf: 'sample',
          encoding: 'UTF-8',
          show_as_html: params[:debug].present?
  end

    respond_to do |format|
      format.html
      format.csv do
          send_data render_to_string, filename: "aseet_list_export.csv", type: :csv
      end
   
    end
  end


  def import
    Fixedasset.import(params[:file])
    redirect_to "/fixedassets"
  end


  # GET /fixedassets/1
  # GET /fixedassets/1.json
  def show
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: 'show',
               encoding: 'UTF-8',
               show_as_html: params[:debug].present?
        end
     end
  end

  # GET /fixedassets/new
  def new
    @fixedasset = Fixedasset.new
  end

  # GET /fixedassets/1/edit
  def edit
  end

  # POST /fixedassets
  # POST /fixedassets.json
  def create
    @fixedasset = Fixedasset.new(fixedasset_params)

    respond_to do |format|
      if @fixedasset.save
        format.html { redirect_to @fixedasset, notice: '作成しました' }
        format.json { render :show, status: :created, location: @fixedasset }
      else
        format.html { render :new }
        format.json { render json: @fixedasset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixedassets/1
  # PATCH/PUT /fixedassets/1.json
  def update
    respond_to do |format|
      if @fixedasset.update(fixedasset_params)
        format.html { redirect_to @fixedasset, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @fixedasset }
      else
        format.html { render :edit }
        format.json { render json: @fixedasset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixedassets/1
  # DELETE /fixedassets/1.json
  def destroy
    @fixedasset.destroy
    respond_to do |format|
      format.html { redirect_to fixedassets_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixedasset
      @fixedasset = Fixedasset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fixedasset_params
      params.require(:fixedasset).permit(:create_date, :asset_number, :case_name, :acquisition_date, :modeltype_name, :serial_number, :place_summary, :place_detail, :etc_content)
    end
end
