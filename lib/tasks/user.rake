namespace :user do
  desc "Sending out the newsletter to all users"
  task :newsletter_all => :environment do
    if Time.now.friday? && (Ticket.where(taken: false) != [])
      users = User.all
      puts "Enqueuing email to #{users.size} users..."
      users.each do |user|
        UserMailer.newsletter(user).deliver_later
      end
      # rake task will return when all jobs are _enqueued_ (not done).
    end
  end
end
