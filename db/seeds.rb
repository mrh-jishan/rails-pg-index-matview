Role.insert_all([{ :label => 'admin' }, { :label => 'manager' }, { :label => 'register' }, { :label => 'user' }], :unique_by => :label)

100000.times.each do |i|
  User.create!(:first_name => "first-#{i}", :last_name => "last-#{i}", :email => "user-#{i}@gmail.com", :role_ids => Role.limit(2).ids)
end