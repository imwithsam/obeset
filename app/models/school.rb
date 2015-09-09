class School < OpenStruct
  # Technically, OpenStructs should have only data, not behavior like the
  #   class methods below. (Normally, you would use OpenStruct directly
  #   rather than inheriting from it.)

  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    # new(school) is the same as School.new(school)
    service.schools.map { |school| new(school) }
  end

  def self.find(id)
    new(service.school(id))
  end

  def self.create(params)
    School.new(service.create_school(params))
  end

  def self.update(id, params)

  end

  # Inheriting from OpenStruct gives you the below functionality for free.
  # It automatically creates an accessor for each key of a hash.
  # You may want to manually write code like below instead if you don't want to
  #   create accessors for every single key.
  #
  # attr_accessor :id,
  #               :uid,
  #               :overweight_percentage,
  #               :obese_percentage,
  #               :county_id

  # def initialize(data)
  #   @id = data["id"]
  #   @uid = data["uid"]
  #   @overweight_percentage = data["overweight_percentage"]
  #   @obese_percentage = data["obese_percentage"]
  #   @county_id = data["county_id"]
  # end
end
