class Forum < ActiveRecord::Base
  attr_accessible :description, :name, :category
  
  has_many :topics, :dependent => :destroy
  
  validates_presence_of :description, :name
  
  def post_count
    f = self.topics.all
    c=0
    for k in f 
      c=c+k.comments.count
    end
    return c
  end
  
end
