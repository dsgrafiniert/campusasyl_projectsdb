class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  def index
    @uploads = Upload.all
  end

  def show
  end

  def new
    @upload = Upload.new
  end

  def edit
  end

  def upload
    @upload = Upload.new(upload_params)

    uploaded_io = params[:file]

    File.open(Rails.root.join('public', 'uploads', Digest::SHA1.hexdigest([Time.now, rand].join)+"."+uploaded_io.original_filename.split(".")[1]), 'wb') do |file|
      file.write(uploaded_io.read)
      @upload.file = file
      @upload.name = uploaded_io.original_filename
    end

    respond_to do |format|
      if @upload.save
        format.html { redirect_to edit_upload_path(@upload), notice: 'Datei erfolgreich hochgeladen' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    project = @upload.project
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to project_url(project), notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params[:upload].permit(:name, :description, :file, :project_id)
    end
end
