class EntryController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])

    @entry.content = @entry.content.gsub("/images/", "/resource/")

  end
end
