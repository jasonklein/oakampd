desc "Remove gigs more than a week old."
task :past_gigs => :environment do
  past_gigs = Gig.where("showdate < ?", Time.current.to_date)
  past_gigs.destroy_all
end
