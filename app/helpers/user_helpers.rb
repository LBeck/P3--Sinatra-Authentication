helpers do

 def show_all_users
    User.all.each do |user|
      p user
    end
 end

end