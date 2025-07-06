ActiveSupport::Notifications.subscribe("reading.created") do |name, started, finished, unique_id, data|
  user = data[:user]
  book = data[:book]

  Rails.logger.info "📖 O usuário #{user.name} leu o livro '#{book.title}' (#{book.published_year})"
end