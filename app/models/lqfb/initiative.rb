class LQFB::Initiative < LQFB::Base
  
  def self.get params
    xml_hash(super(params))['initiative_list']['initiative']
  end
  
end