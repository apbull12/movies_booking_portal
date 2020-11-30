module ScreeningsHelper
  def get_show_summary(id)
    show = Show.find_by(id: id)
    movie_name = show.movie.name
    show_summary = 'Movie name: ' + movie_name + ", Date: " + show.show_date.to_date.to_s + ", Time Slots: " + show.show_slot.reject(&:empty?).join(' / ')
    show_summary
  end
end
