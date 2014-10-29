class GigsController < ApplicationController

  before_filter :authenticate_user!, except: :index
  load_and_authorize_resource

  def index
    @gigs = Gig.all
    @first_ids = firsts_or_lasts_of_the_month_ids(@gigs)
    @last_ids = firsts_or_lasts_of_the_month_ids(@gigs.reverse)
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new params[:gig]
    @gig.price = @gig.price ? @gig.price : -1
    if @gig.save
      redirect_to root_path, notice: "Gig added!"
    else
      render "new"
    end
  end

  def new_by_csv
    count = create_gigs_from_file_and_return_count params[:gigs_csv].path
    redirect_to root_path, notice: "#{count} gigs added!"
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def firsts_or_lasts_of_the_month_ids(gigs)

    ### Assumes proper chrono. ordering by default_scope
    ### Puts the first occurence of each month into an array

    firsts = []
    firsts << gigs.first
    count = gigs.count - 1

    count.times do |i|
      first_gig = gigs[i]
      second_gig = gigs[i + 1]
      if first_gig.showdate.month != second_gig.showdate.month
        firsts << second_gig
      end
    end

    ids = []
    if firsts.any?
      firsts.each do |first|
        ids << first.id
      end
    end
    ids
  end



  def create_gigs_from_file_and_return_count(csv_path)
    require 'csv'

    gigs_to_add = CSV.read csv_path
    gigs_to_add.each do |gig|
      new_gig = Gig.new
      new_gig.showdate = Date.strptime(gig[0], "%m/%d/%Y")
      new_gig.band = gig[1]
      new_gig.venue_name = gig[2]
      # new_gig.venue_address = gig[3]
      new_gig.price = gig[3] ? gig[3] : -1
      new_gig.url = gig[4]
      new_gig.save
    end
    gigs_to_add.count
  end
end
