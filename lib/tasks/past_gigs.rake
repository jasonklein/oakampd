desc "Remove gigs more than a week old."
task :past_gigs => :environment do
  past_gigs = Gig.where("showdate < ?", 1.days.ago)
  past_gigs.destroy_all
end
