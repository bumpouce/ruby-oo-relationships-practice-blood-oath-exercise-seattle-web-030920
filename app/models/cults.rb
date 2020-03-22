class Cult
    attr_reader :name, :location, :founding_year, :slogan
    attr_accessor :minimum_age
    @@all = []

    def initialize (name, location, founding_year, slogan, minimum_age=0)
        @name = name
        @location = location #city name
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age

        @@all << self
    end

    def recruit_follower (follower, initiation_date)        
        if follower.age >= self.minimum_age
            BloodOath.new(follower, self, initiation_date)
        else
            "I'm sorry, you're not old enough to be a member of #{self.name}"
        end     
    end

    def cult_info 
        BloodOath.all.select {|oath| oath.cult == self }
    end

    def cult_population
        cult_info.count
    end

    def average_age
        cult_info.map {|oath| oath.follower.age}.sum  / cult_population
    end

    def my_followers_mottos
        cult_info.map { |oath| oath.follower.life_motto}
    end

    def self.all
        @@all
    end

    def self.find_by_name (find_cult_name)
        Cult.all.select {|cult| cult.name == find_cult_name}
    end

    def self.find_by_location (find_location)
        Cult.all.select {|cult| cult.location == find_location}
    end

    def self.find_by_founding_year (find_founding_year)
        Cult.all.select {|cult| cult.founding_year == find_founding_year}
    end

    def self.least_popular
        list_of_cults = BloodOath.all.map {|oath| oath.cult }
        cult_counts = list_of_cults.each_with_object(Hash.new(0)) { |cult, counts| counts[cult] += 1}
        cult_counts.keep_if {|cult, count| count == cult_counts.values.max}.keys
    end

    def self.most_common_location
        locations = Cult.all.map {|cult| cult.location}
        locations.each_with_object(Hash.new(0)) { |location,counts| counts[location] += 1 }.max[0]
    end
end
