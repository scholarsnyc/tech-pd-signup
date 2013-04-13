DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}signups.db")

class Signup
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  
  belongs_to :session
end

class Session
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :capacity, Integer, :default => 10
  
  has n, :signups
    
  def remaining
    capacity - signups.count
  end
  
  def self.populate!
    [
      "Flipping Your Classrooms",
      "Developing Curriculum on Google and Google Doc ",
      "How to Screencasts for Portions of Your Lessons",
      "Developing iLearn Coursework/Blended Learning",
      "iPads in the Classroom ",
      "SMART Boards and the Common Core"
      "Technology Grab Bag: Be More Effecient and Effective with Technology"
    ].each do |session|
      Session.create({title: session})
    end
  end
  
end

DataMapper.finalize
DataMapper.auto_upgrade!