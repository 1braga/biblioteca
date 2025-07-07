class UpdateReadingStatsJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find_by(id: user_id)
    return unless user

    total_lidos = user.readings.where(status: "Lido").count
    user.update(readings_count: total_lidos)
  end
end
