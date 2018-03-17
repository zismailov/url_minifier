class StatisticBuildService
  def initialize(params)
    @params = params
  end

  def call
    statistics_insert = "INSERT INTO statistics (date,gadget,browser,url_id,created_at,updated_at) VALUES "
    @params.in_groups_of(200, false).each do |group|
      sql_connect.transaction do
        sql_connect.execute statistics_insert + group.join(",") + ";"
      end
    end
  end

  private

  def sql_connect
    ActiveRecord::Base.connection
  end
end
