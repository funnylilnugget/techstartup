namespace :posts do
  desc "Delete posts after marked completed for 2 days"
  task delete_after_complete: :environment do
    Post.where(['date_completed < ?', Date.today - 1.day ]).destroy_all
  end

end
