class BookQuery
  def initialize(params, relation = Book.all)
    @params = params
    @relation = relation
  end

  def results
    filter_by_genre
    filter_by_year
    filter_by_title
    @relation
  end

  private

  def filter_by_genre
    return if @params[:genre].blank?
    @relation = @relation.where(genre: @params[:genre])
  end

  def filter_by_year
    return if @params[:year].blank?
    @relation = @relation.where(published_year: @params[:year])
  end

  def filter_by_title
    return if @params[:query].blank?
    @relation = @relation.where("title ILIKE ?", "%#{@params[:query]}%")
  end
end