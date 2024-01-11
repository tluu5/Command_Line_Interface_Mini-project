class Show
  attr_accessor :title, :network, :viewers_favorite

  def initialize(title, network)
    @title = title
    @network = network
    @viewers_favorite = false
  end
end
