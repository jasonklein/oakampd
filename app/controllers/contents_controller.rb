class ContentsController < ApplicationController

  load_and_authorize_resource

  def edit
    @content = Content.first
  end

  def update
    if @content.update_attributes content_params
      redirect_to edit_content_path, :notice => "Content was successfully updated."
    else
      render "edit"
    end
  end

  private

  def content_params
    params.require(:content).permit(:gigs_header, :venues_header, :bands_header, :about_header, :about_content)
  end
end
