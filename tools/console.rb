require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Test cult setup: Cult.new(name, location, founding_year, slogan)
cult1 = Cult.new("Church of Satan", "San Francisco", 1966, "Satanic Panic", 18)
cult2 = Cult.new("Peoples Temple", "Jonestown", 1955, "Drink the Kool-Aid", 40)
cult3 = Cult.new("Raelism", "Paris", 1976, "We come in peace")
cult4 = Cult.new("The Family", "San Francisco", 1967, "Helter Skelter")

Cult.find_by_name("Raelism")
Cult.find_by_founding_year(1955)
Cult.find_by_location("San Francisco")

#Test follower setup: Follower.new(name, age, life_motto)
follower1 = Follower.new("Charles Manson", 21, "Never Leave Me")
follower2 = Follower.new("Jim Jones", 26, "This is Utopia")
follower3 = Follower.new("Tony Alamo", 55, "God and Rock 'n' Roll")
follower4 = Follower.new("Marcus Delon Wesson", 32, "Make your own congregation")
follower5 = Follower.new("John Griggs", 21, "Try this LSD")


#Test blood oath setup: BloodOath.new(follower, cult, initiation_date).  Initiation date string: YYYY-MM-DD
oath1 = BloodOath.new(follower1, cult1, "2000-03-13")
oath2 = BloodOath.new(follower1, cult2, "1968-12-25")
oath3 = BloodOath.new(follower2, cult4, "2000-03-13")
oath4 = BloodOath.new(follower3, cult3, "1974-07-06")
oath5 = BloodOath.new(follower3, cult2, "1995-06-29")
oath6 = BloodOath.new(follower4, cult2, "1968-12-25")
oath7 = BloodOath.new(follower5, cult1, "1984-11-30")
oath8 = BloodOath.new(follower5, cult3, "1974-07-06")


#Test recruit_follower (follower, initiation_date)
cult1.recruit_follower(follower1, "2020-03-09")
cult1.recruit_follower(follower3, "2020-03-09")
cult1.recruit_follower(follower2, "2020-03-09")
cult1.recruit_follower(follower4, "2020-03-09")


# #Test join_cult(cult, initiation_date)
follower1.join_cult(cult3, "1920-03-15")
follower1.join_cult(cult4, "2020-03-15")
follower2.join_cult(cult2, "2020-03-15")

pop1 = cult1.cult_population
pop2 = cult2.cult_population
pop3 = cult3.cult_population
pop4 = cult4.cult_population

belong1 = follower1.cults
belong2 = follower2.cults
belong3 = follower3.cults
belong4 = follower4.cults
belong5 = follower5.cults

binding.pry

# puts "Mwahahaha!" # just in case pry is buggy and exits
