class ContentsController < ApplicationController

  load_and_authorize_resource

  def edit
    @content = Content.first
  end

  def update
    if @content.update_attributes(params[:content])
      redirect_to edit_content_path, :notice => "Content was successfully updated."
    else
      render "edit"
    end
  end
end
