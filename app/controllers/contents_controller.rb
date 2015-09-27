class ContentsController < ApplicationController

  load_and_authorize_resource

  def edit
    @content = Content.first
  end

  def update
    if @content.update content_params
      redirect_to edit_content_path, :notice => "Content was successfully updated."
    else
      render "edit"
    end
  end

  private

  def content_params
    params.require(:content).permit(:about_content, :about_header, :bands_header, :features_header, :gigs_header, :venues_header)
  end
end
