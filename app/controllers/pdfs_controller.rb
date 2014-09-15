class PdfsController < ApplicationController

  def show
    @pdf = Pdf.find(params[:id])
  end

  def index
    @pdfs = Pdf.all
  end

  def new
    @pdf = Pdf.new
  end

  def create
    @pdf = Pdf.new(pdf_params)

    if @pdf.save
      redirect_to @pdf
      redirect_to pdfs_path, notice: "The Pdf #{@pdf.name} has been uploaded !"
    else
      render "new"
    end
  end

  def destroy
    @pdf = Pdf.find(params[:id])
    @pdf.destroy
    redirect_to pdfs_path, notice:  "The PDF #{@pdf.name} has been deleted."
  end

  private
    def pdf_params
      params.require(:pdf).permit(:name, :attachment)
    end

end
