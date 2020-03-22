class Follower

    attr_reader :name, :age
    attr_accessor :life_motto, :cults
    @@all = []

    def initialize (name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def join_cult(cult, initiation_date)
        if self.age >= cult.minimum_age
            BloodOath.new(self, cult, initiation_date)
        else
            "I'm sorry, you're not old enough to be a member of #{cult.name}"
        end     
    end

    def cults
        my_oaths = []
        my_oaths = BloodOath.all.select {|oath| oath.follower == self }
        my_oaths.map {|found| found.cult}
    end

    def my_cults_slogans
        cults.map { |oath| oath.slogan}
    end

    def fellow_cult_members
        cults.uniq.map do |my_cult| 
            my_cult.cult_info.map { |oath| "#{my_cult.name}: #{oath.follower.name}"}.uniq
        end
    end

    def self.all
        @@all
    end 

    def self.of_a_certain_age (that_age)
        Follower.all.select {|follower| follower.age >= that_age}
    end

    def self.activity
        followers = BloodOath.all.map { |oath| oath.follower}
        member_count = followers.each_with_object(Hash.new(0)) { |follower,counts| counts[follower] += 1 }
    end

    def self.most_active
        activity.max_by {|key, value| value}[0]
    end

    def self.top_ten
        activity.max_by(10) {|key, value| value}.map {|array| array[0]}
    end
end