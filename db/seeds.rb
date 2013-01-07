# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(first_name: "Marvin", last_name: "Ahlgrimm", email: "m.j.ahlgrimm@gmx.de", password: "foobar", password_confirmation: "foobar")
user.toggle!(:admin)
user2 = User.create(first_name: "Jan", last_name: "Foo", email: "m.j.ahlgrimm@gmx.de", password: "foobar", password_confirmation: "foobar")
user2.toggle!(:admin)
(1..50).each do |i|
	User.create(first_name: "Test#{i}", last_name: "Example", email: "test#{i}@example.de", password: "foobar", password_confirmation: "foobar")
end


(1..12).each do |p|
	user.blog_posts.create(title: "Lore ipsum", content: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
	 sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
	  no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
	   sed diam voluptua.")

	user2.blog_posts.create(title: "Fool", content: " There was no lie in Pippin's eyes. A fool... but an honest fool, he remains.
	 He told Sauron nothing of the Ring. We've been strangely fortunate. Pippin saw in the Palantir a glimpse of the enemy's plan. Sauron moves to strike Minas Tirith. ")
end