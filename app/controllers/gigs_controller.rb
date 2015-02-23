class GigsController < ApplicationController

  before_filter :authenticate_user!, except: :index
  load_and_authorize_resource

  def index
    @gigs = Gig.all
    @first_ids = firsts_or_lasts_of_the_month_ids(@gigs)
    @last_ids = firsts_or_lasts_of_the_month_ids(@gigs.reverse)
    @ads = ads
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
end
