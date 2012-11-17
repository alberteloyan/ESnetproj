class Server < ActiveRecord::Base

  has_many :categories	
  attr_accessible :hostname, :ip, :categories

  before_update :getIp

  require 'open-uri'
  require 'socket'

  def getIp
    if self.ip.blank?
      self.ip = IPSocket::getaddress(self.hostname)
    end
  end

end
