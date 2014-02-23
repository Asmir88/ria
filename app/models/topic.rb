class Topic < ActiveRecord::Base
  attr_accessible :body, :name, :forum_id
  
  belongs_to :forum
  belongs_to :user
  
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :body, :name


end
