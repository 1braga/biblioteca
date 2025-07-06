class RegisterReadingService
  def initialize(user:, book:)
    @user = user
    @book = book
  end

  def call
    reading = Reading.create(user: @user, book: @book)

    if reading.persisted?
      ActiveSupport::Notifications.instrument("reading.created", {
        user: @user,
        book: @book
      })
    end

    reading
  end
end
