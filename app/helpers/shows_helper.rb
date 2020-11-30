module ShowsHelper
  def movies_list
    Movie.active.pluck(:id,:name).to_h
  end

  def find_movie(id)
    Movie.find_by(id: id).name
  end
end
