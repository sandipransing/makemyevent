# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create( :name => "Robert" , :dob => "1 jan 1980", :job_title => "Prof", :mobile =>"9234567890" , :address => "Australia",:email => "robert_1980@gmail.com", :photo => open("#{Rails.root}/app/assets/profile/1.jpg")  )

User.create( :name => "Alvin" , :dob => "1 jan 1985", :job_title => "Software Engineer", :mobile =>"8234894560" , :address => "Canada",:email => "alvin_1985@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/2.jpg")  )

User.create( :name => "Kristin" , :dob => "1 jan 1983", :job_title => "Doctor", :mobile =>"7234567890" , :address => "England",:email => "kristin_1983@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/3.jpg")  )

User.create( :name => "taylor" , :dob => "1 jan 1990", :job_title => "Nurse", :mobile =>"9234567890" , :address => "Italy",:email => "taylor_1990@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/4.jpg")  )

User.create( :name => "Justin" , :dob => "1 jan 1982", :job_title => "Analyst", :mobile =>"8234567890" , :address => "Street 23 , UK ",:email => "justin_1982@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/5.jpg")  )

User.create( :name => "Bob" , :dob => "1 jan 1981", :job_title => "Progammer", :mobile =>"9234567890" , :address => "Australia",:email => "bob_1981@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/6.jpg")  )

User.create( :name => "Steve" , :dob => "1 jan 1978", :job_title => "Engineer", :mobile =>"7234567890" , :address => "Spain",:email => "steve_1978@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/7.jpg")  )

User.create( :name => "Maria" , :dob => "1 jan 1962", :job_title => "Prof", :mobile =>"9234567890" , :address => "Iran",:email => "maria_1962@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/8.jpg")  )

User.create( :name => "John" , :dob => "1 jan 1980", :job_title => "Teacher", :mobile =>"7234567890" , :address => "South Africa",:email => "john_1980@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/9.jpg")  )

User.create( :name => "Danial" , :dob => "1 jan 1975", :job_title => "Prof", :mobile =>"9234567890" , :address => "Australia",:email => "danial_1975@gmail.com", :photo => open( "#{Rails.root}/app/assets/profile/10.jpg")  )

Event.create( :name => "Blood Donation" , :short_desc => "The Bloodbank urgently need the assistance of A, B, and O blood types to come forward to donate blood this week.",:description => "Donating blood is a simple thing to do, but it can make a big difference in the lives of others. The donation process from the time you arrive until the time you leave takes about 30 minutes. The donation itself is only about 8-10 minutes on average.", :organizer_name => "Robert", :organizer_mobile_no =>"9234567890" , :location => "Bloodbank@ Dhoby Ghaut Dhoby Xchange 11 Orchard Road #B1-05 to 09 Singapore 238826", :logo => open( "#{Rails.root}/app/assets/logo/1.jpg"), :start_date => Time.now + 400000 , :end_date => Time.now + 600000 , :published => true, :user => User.all.sample )

Event.create( :name => "Bay to Breakers" , :short_desc => "Bay to Breakers is an annual footrace which takes place in San Francisco, California",:description=>"The Bay to Breakers is known for the large number of unregistered runners, or 'bandits', who participate in the race. Ross Mirkarimi, a member of the San Francisco Board of Supervisors, reported that over half of the 60,000 participants in the 2010 Bay to Breakers were unregistered.[20] San Francisco Mayor Gavin Newsom was among the runners in 2010 who did not pay the registration fee to obtain a race number", :organizer_name => "Bob", :organizer_mobile_no =>"8234567890" , :location => "San Francisco, California ", :logo => open( "#{Rails.root}/app/assets/logo/2.jpg"), :start_date => Time.now + 10000 , :end_date => Time.now + 40000 ,:published => true ,:featured => true, :user => User.all.sample )

Event.create( :name => "Asia Cup, an Indo-Pak Coding Event." , :short_desc => "This is not just any coding coding competition, its an Indo-Pak Coding Competition..",:description => "ACM@IITD, the ACM Student-Chapter of IIT Delhi, is proud to announce the Asia Cup, an Indo-Pak Coding Event. This is your golden chance to render invaluable national service. The honour of an entire nation rests on your shoulders. So, put on your thinking caps and get cracking",:organizer_name => "Steve", :organizer_mobile_no =>"9234567890" , :location => "IIT Kanpur, Kalyanpur, Kanpur, Uttar Pradesh", :logo => open( "#{Rails.root}/app/assets/logo/3.jpg"), :start_date => Time.now + 10000 , :end_date => Time.now + 40000 ,:published => true  ,:featured => true, :user => User.all.sample )

Event.create( :name => "Executive Health Checkup" , :short_desc => "Health Check is part of Kokilaben Hospital 's pursuance of excellence in healthcare and belief that preventative care is a wise investment.",:description => "  The Health Check program is a thorough determination of your health status with a customized wellness program for your continued good health.Kokilaben Hospital's physician team highly recommends this annual series of tests and examinations.The Health Check program assures you an experienced physician team of world-renowned specialists, cutting-edge technology, personal services and confidentiality", :organizer_name => "taylor", :organizer_mobile_no =>"8234567890" , :location => "Rao Saheb Achutrao Patwardhan Marg,Four Bunglows,Andheri (W) Mumbai - 400053", :logo => open( "#{Rails.root}/app/assets/logo/4.jpg"), :start_date => Time.now + 10000 , :end_date => Time.now + 40000 , :published => true ,:featured => true, :user => User.all.sample )

Event.create( :name => "Guthrie Community Blood Drive" , :short_desc => "Guthrie Community residents are encouraged to give blood",:description => "Each donor this fall receives:Anyone who is healthy and 16 years of age can donate* and donations can be made every 56 days.", :organizer_name => "Maria", :organizer_mobile_no =>"9234567880" , :location => "Southern Baptist Church, Italy" , :logo => open( "#{Rails.root}/app/assets/logo/5.jpg"), :start_date => Time.now + 1000000 , :end_date => Time.now + 4000000 , :published => true ,:featured => true, :user => User.all.sample )

Event.create( :name => "Annual charity clay pigeon shoot" , :short_desc => "Twenty-five teams of four guns took part in the exciting competition.", :description=>"Twenty-five teams of four guns took part in the exciting competition. As well as an eventful morning of shooting, guests enjoyed a cocktail reception, musical entertainment and the world famous RAF Red Arrows Aerobatic Display Team performed a stunning 22-minute air display.",:organizer_name => "John", :organizer_mobile_no =>"7232567890" , :location => "Pangbourne, Berkshire.", :logo => open( "#{Rails.root}/app/assets/logo/6.jpg"), :start_date => Time.now + 10000 , :end_date => Time.now + 40000 , :published => true, :user => User.all.sample  )

Event.create( :name => "Cape Town International Boat Show" , :short_desc => " Biggest annual get together for the boating and water sports industry in South Africa", :description => "The Cape Town International Boat Show, the biggest annual get together for the boating and water sports industry in South Africa, takes place in Cape Town at the Cape Town International Convention Centre, and the number 1 tourist destination, the V&A Waterfront, against the backdrop of one of the Natural Wonders of the World, Table Mountain.",:organizer_name => "John", :organizer_mobile_no =>"9834567890" , :location => "Convention Square, 1 Lower Long Street, Cape Town", :logo => open( "#{Rails.root}/app/assets/logo/7.jpg"), :start_date => Time.now + 2000000 , :end_date => Time.now + 4000000 , :published => true, :user => User.all.sample  )

e = Event.create( :name => "Bengali Film Screening" , :short_desc => " Bengali Film Screening: Guerilla Directed By Nasiruddin Yousuff", :description => "",:organizer_name => "Rahul", :organizer_mobile_no =>"9834567890" , :location => "National Film Archive Of India Post Box 81 Law College Road PMC, Pune", :logo => open( "#{Rails.root}/app/assets/logo/8.jpg"), :start_date => Time.now - 9000000 , :end_date => Time.now - 700000 , :published => true, :user => User.all.sample  )
e.save( :validate => false )

e = Event.create( :name => "Baalivadham" , :short_desc => "a Kathakali Dance by Kalasagar", :description => "",:organizer_name => "Rupali", :organizer_mobile_no =>"9834557890" , :location => "Spaces 1, Elliot's Beach Road Besant Nagar Chennai", :logo => open( "#{Rails.root}/app/assets/logo/9.jpg"), :start_date => Time.now - 600000 , :end_date => Time.now - 400000 , :published => true, :user => User.all.sample  )
e.save( :validate => false )

Event.create( :name => "East Coast Swing Dance Class" , :short_desc => "The Petersons are teaching East Coast Swing!", :description => "The Petersons are teaching East Coast Swing! Cost of each class is $15 per couple. Come join the fun and learn something new! Shall We Dance?",:organizer_name => "Daine Peterson", :organizer_mobile_no =>"9834417890" , :location => "Angel Fire Country Club, 101 Country Club Drive Angel Fire, NM 87710", :logo => open( "#{Rails.root}/app/assets/logo/10.jpg"), :start_date => Time.now + 80000000 , :end_date => Time.now + 90000000  , :published => true, :user => User.all.sample )

Event.create( :name => "Angel Fire Country Club" , :short_desc => "The purpose of the hearing is to analyze the newest developments regarding the straying of the democratic principles in Romania.", :description => "Why are Romanians protesting and what are are the main abuses they are complaining about? European leaders, Romanian politicians, civil society representatives and journalists aim to establish a dialogue which has been refused until now.The meeting will be hosted by Hannes Swoboda, leader of the S&D Group in the EP and Guy Verhofstadt, leader of the ALDE Group in the EP.",:organizer_name => "norica", :organizer_mobile_no =>"7234567890" , :location => "BRUSSELS EP Room PHS 03C50", :logo => open( "#{Rails.root}/app/assets/logo/11.jpg"), :start_date => Time.now + 40000000 , :end_date => Time.now + 50000000 , :published => true, :user => User.all.sample )

e = Event.new( :name => "2nd National Conference on Excellence in Higher Education" , :short_desc => "The drivers of excellence are many and research does not seem to converge on a globally acceptable list. What however is of little debate in the critical role of leadership, both in the government and the non government sector", :description => "The first National Conference on Excellence in Higher Education was held on April 1-3, 2011 at IIT Delhi. The conference explored the theme and attempted to identify the drivers of excellence in general and quality of higher education in particular.",:organizer_name => "Arihant", :organizer_mobile_no =>"9834567890" , :location => "Department of Managment Studies Vishwakarma Bhawan Indian Institute of Technology", :logo => open( "#{Rails.root}/app/assets/logo/12.jpg"), :start_date => Time.now - 6000000 , :end_date => Time.now - 3000000 , :published => true, :user => User.all.sample )
e.save( :validate => false )
