class GigsController < ApplicationController

  before_filter :authenticate_user!, except: :index
  load_and_authorize_resource

  def index
    @first_ids, @last_ids = firsts_and_lasts_of_the_month_ids(@gigs)
    @ads = ads
  end

  def new
  end

  def create
    @gig.price = @gig.price ? @gig.price : -1
    if @gig.save
      redirect_to root_path, notice: "Gig added!"
    else
      render "new"
    end
  end

  def new_by_csv
    gigs_added, duplicates = create_gigs_from_file_and_return_counts params[:gigs_csv].path
    redirect_to root_path, notice: "#{gigs_added} gig(s) added; #{duplicates} duplicate(s) found."
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @gig.update_attributes(params[:gig])
        format.html { redirect_to root_path, :notice => "Gig was successfully updated." }
        format.json { respond_with_bip @gig }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@gig) }
      end
    end
  end

  def destroy
    @gig.destroy
    redirect_to root_path, notice: "Gig deleted."
  end

  def firsts_and_lasts_of_the_month_ids(gigs)

    ### Assumes proper chrono. ordering by default_scope
    ### Puts ids of adjacent gigs with different months into
    ### first_ids and last_ids arrays, returning both

    first_ids = []
    last_ids = []
    count = gigs.count - 1

    first_ids << gigs.first.id

    count.times do |i|
      first_gig = gigs[i]
      second_gig = gigs[i + 1]
      if first_gig.showdate.month != second_gig.showdate.month
        first_ids << second_gig.id
        last_ids << first_gig.id
      end
    end

    last_ids << gigs.last.id

    return first_ids, last_ids
  end

  def create_gigs_from_file_and_return_counts(csv_path)
    require 'csv'
    gigs_added = 0
    empty_rows = 0
    gigs_to_add = CSV.read csv_path
    gigs_to_add.each do |gig|
      if !gig[0]
        empty_rows += 1
        next
      else
        showdate = gig[0].gsub("-","/")
        band = gig[1]
        venue_name = gig[2]
        price = gig[3] ? gig[3] : -1
        url = gig[4]
        
        new_gig = Gig.where(showdate: showdate, band: band, venue_name: venue_name, price: price, url: url).first_or_create
        gigs_added += 1 if new_gig.created_at > 4.seconds.ago
      end
    end
    duplicates = gigs_to_add.count - empty_rows - gigs_added
    return gigs_added, duplicates
  end

  def ads
    [["block-ad-bagrc.jpg", "http://www.bayareagirlsrockcamp.org/"],
    ["block-ad-econo-jam.png", "https://www.facebook.com/EconoJamRecords"],
    ["block-ad-mall-walk.jpg", "http://mallwalkband.com/"],
    ["block-ad-oakland-drops.jpg", "http://www.oaklanddropsbeats.com/"]]
  end

  private

  def gig_params
    params.require(:gig).permit(:band, :price, :showdate, :url, :venue_name, :venue_address)
  end
end
