# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "rj001", last_name: "Johnson", first_name: "Ralph", role: "admin", type: "Admin", password: "qq", password_confirmation: "qq")
User.create(username: "jw001", last_name: "Williams", first_name: "Jay", role: "admin", type: "Admin", password: "qq", password_confirmation: "qq")
User.create(username: "ch001", last_name: "Hampshire", first_name: "Catherine", role: "admin", type: "Admin", password: "qq", password_confirmation: "qq")
User.create(username: "ff001", last_name: "Flintstone", first_name: "Fred", password: "qq", password_confirmation: "qq", address: '1236 Rocky Way', city: 'Bedrock', state: 'AZ', zip: '86404', email: 'fred@hanna-barbera.com')
User.create(username: "as001", last_name: "Seville", first_name: "Alvin", password: "qq", password_confirmation: "qq", address: '32141 Bagdaserian St.', city: 'Studio City', state: 'CA', zip: '91614', email: 'chipndale@seville.com')
User.create(username: "br001", last_name: "Rubble", first_name: "Betty", password: "qq", password_confirmation: "qq", address: '1234 Rocky Way', city: 'Bedrock', state: 'AZ', zip: '86404', email: 'fred@hanna-barbera.com')
User.create(username: "jb001", last_name: "Bloe", first_name: "Joe", password: "qq", password_confirmation: "qq", address: '1000 Main', city: 'Salt Lake City', state: 'UT', zip: '84116', email: 'joblo@generic.com')
User.create(username: "ls001", last_name: "Skywalker", first_name: "Luke", password: "qq", password_confirmation: "qq", address: '23 Kenobi Ave', city: 'Tattoine', state: 'NV', zip: '89007', email: 'force@lucas-arts.com')
User.create(username: "co001", last_name: "Oswald", first_name: "Clara", password: "qq", password_confirmation: "qq", address: '1212 Tardis', city: 'St. George', state: 'UT', zip: '84790', email: 'clara@universe.com')
User.create(username: "pc001", last_name: "Chekov", first_name: "Pavel", password: "qq", password_confirmation: "qq", address: '1701 Enterprise Dr', city: 'Starwood', state: 'CA', zip: '92368', email: 'pavel@roddenberry.com')
User.create(username: "kj001", last_name: "Janeway", first_name: "Katheryn", password: "qq", password_confirmation: "qq")

Job.create(project: "Smith's Reset", store_name: "Smith's", store_num: "334", address: "2255 E. Centennial Pkwy", city: "Las Vegas", state: "NV", zip: "89084", phone: "702-633-7222", start_date: "2015-03-30", end_date: "2015-04-10", time: "7 am", timezone: "Pacific Time (US & Canada)", sched_hrs: 8, manpower: 8)
Job.create(project: "Smith's Reset", store_name: "Smith's", store_num: "274", address: "5710 W 7800 S", city: "West Jordan", state: "UT", zip: "84081", phone: "801-545-3480", start_date: "2015-04-06", end_date: "2015-04-17", time: "7 am", timezone: "Mountain Time (US & Canada)", sched_hrs: 8, manpower: 6)
Job.create(project: "Albertons's Reset", store_name: "Albertson's", store_num: "413", address: "3322 132nd St SE", city: "Bothell", state: "WA", zip: "98012", phone: "425-338-3956", start_date: "2015-03-09", end_date: "2015-03-13", time: "7 am", timezone: "Pacific Time (US & Canada)", sched_hrs: 8, manpower: 5)
Job.create(project: "PetSmart Reset", store_name: "PetSmart", store_num: "172", address: "389 W 1830 S", city: "Salt Lake City", state: "UT", zip: "93036", phone: "801-466-0313", start_date: "2015-03-16", end_date: "2015-03-21", sat: true, time: "7 am", timezone: "Mountain Time (US & Canada)", sched_hrs: 8, manpower: 7)
Job.create(project: "Vons Reset", store_name: "Vons", store_num: "2436", address: "2101 N Rose Ave", city: "Oxnard", state: "CA", zip: "84115", phone: "805-981-2495", start_date: "2015-03-16", end_date: "2015-03-27", time: '2015-03-16 15:00:00', timezone: "Pacific Time (US & Canada)", sched_hrs: 8, manpower: 4)
Job.create(project: "Finney's Reset", store_name: "Finney's", store_num: "234", address: "1234 Alvarado", city: "Provo", state: "UT", zip: "84604", phone: nil, start_date: "2015-04-20", end_date: "2015-04-24", sat: false, sun: false, time: "7 am", timezone: "US/Mountain", sched_hrs: 8, manpower: 8)
Job.create(project: "Josephine's Reset", store_name: "Josephine's", store_num: "4321", address: "4433 Main St", city: "Mesquite", state: "NV", zip: "89027", phone: nil, start_date: "2015-03-16", end_date: "2015-03-27", sat: false, sun: false, time: "7 am", timezone: "Pacific Time (US & Canada)", sched_hrs: 8, manpower: 5)



