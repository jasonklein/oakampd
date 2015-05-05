class ContentsController < ApplicationController

  load_and_authorize_resource

  def edit
    @content = Content.first
  end

  def update
  end
end
