class GigsController < ApplicationController
  def index
    @gigs = Gig.all
    @first_ids = first_of_the_month_ids(@gigs)
  end

  def new
    @gig = Gig.new
  end

  def create
  end

  def new_by_csv
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def first_of_the_month_ids(gigs)

    ### Assumes proper chrono. ordering by default_scope
    ### Puts the first occurence of each new month into an array of "firsts"

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
    firsts.each do |first|
      ids << first.id
    end
    ids
  end
end
