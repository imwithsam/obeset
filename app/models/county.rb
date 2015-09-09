class County < OpenStruct
  # Technically, OpenStructs should have only data, not behavior like the
  #   class methods below. (Normally, you would use OpenStruct directly
  #   rather than inheriting from it.)

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    # new(county) is the same as County.new(county)
    service.counties.map { |county| new(county) }
  end

  def self.find(id)
    new(service.county(id))
  end

  # Inheriting from OpenStruct gives you the below functionality for free.
  # It automatically creates an accessor for each key of a hash.
  # You may want to manually write code like below instead if you don't want to
  #   create accessors for every single key.
  #
  # attr_accessor :id,
  #               :name

  # def initialize(data)
  #   @id = data["id"]
  #   @name = data["name"]
  # end
end
