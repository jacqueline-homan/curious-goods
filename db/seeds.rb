# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create!(title: 'Dana 60 Rear', 
	description:
	%{<p>
		The Dana 60 Rear has many advantages over the stock Ford 9",
		namely the fact that it's a full floater and has a 
		better pinion angle. A full-floating axle like the Dana 60 is 
		stronger and is used in heavy duty vehicles: dump trucks, 
		Ford F-250 SuperDuty's, etc. The weight of the vehicle is 
		supported by the spindle, and the axleshafts' only job is to
		transfer engine torque from the differential to the wheels.
		You can't go wrong with the Dana 60 Rear full-floater. 
		</p>},
		image_url: 'Dana.jpg',
		price: 2650.00)