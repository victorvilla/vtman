class VtFilesController < ApplicationController
  before_action :set_vt_file, only: [:show, :edit, :update, :destroy]

  # GET /vt_files
  # GET /vt_files.json
  def index
    @vt_files = VtFile.all
  end

  # GET /vt_files/1
  # GET /vt_files/1.json
  def show
  end

  # GET /vt_files/new
  def new
    @vt_file = VtFile.new
  end

  # GET /vt_files/1/edit
  def edit
  end

  # POST /vt_files
  # POST /vt_files.json
  def create
    @vt_file = VtFile.new(vt_file_params)

    respond_to do |format|
      if @vt_file.save
        format.html { redirect_to @vt_file, notice: 'Vt file was successfully created.' }
        format.json { render :show, status: :created, location: @vt_file }
      else
        format.html { render :new }
        format.json { render json: @vt_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vt_files/1
  # PATCH/PUT /vt_files/1.json
  def update
    respond_to do |format|
      if @vt_file.update(vt_file_params)
        format.html { redirect_to @vt_file, notice: 'Vt file was successfully updated.' }
        format.json { render :show, status: :ok, location: @vt_file }
      else
        format.html { render :edit }
        format.json { render json: @vt_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vt_files/1
  # DELETE /vt_files/1.json
  def destroy
    @vt_file.destroy
    respond_to do |format|
      format.html { redirect_to vt_files_url, notice: 'Vt file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vt_file
      @vt_file = VtFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vt_file_params
      params.require(:vt_file).permit(:path_file, :task_id, :type, :status)
    end
end
