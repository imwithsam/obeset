class SchoolistService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://localhost:3000/v1")
  end

  def schools
    # http://localhost:3000/v1/schools
    parse(connection.get("schools"))
  end

  def school(id)
    # http://localhost:3000/v1/schools/:id
    parse(connection.get("schools/#{id}"))
  end

  def create_school(params)
    parse(connection.post("schools", params))
  end

  def update_school(id, params)
    # Not parsing because the response is nil
    connection.put("schools/#{id}", params)
  end

  def counties
    # http://localhost:3000/v1/counties
    parse(connection.get("counties"))
  end

  def county(id)
    # http://localhost:3000/v1/county/:id
    parse(connection.get("counties/#{id}"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
