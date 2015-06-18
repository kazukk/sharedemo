class Order < ActiveRecord::Base
  validates :address, :city, :state, presence: true

##stuk.io
#OrderごとにユニークなIDを発行
before_create :populate_guid

  belongs_to :listing
#buyer/sellerがそれぞれUserクラスに属することを定義
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"


##stuk.io

 private
 
  def populate_guid
     self.guid = SecureRandom.uuid()
  end


end
