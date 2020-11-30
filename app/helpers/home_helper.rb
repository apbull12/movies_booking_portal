module HomeHelper
  def get_show_details(id)
    show = Show.find_by(id: id)
    movie_name = show.movie.name
    show_summary = { movie_name: movie_name, date: show.show_date.to_date.to_s, slot: show.show_slot.reject(&:empty?).join(' , ') }
    show_summary

  end

  def get_available_seats_count(screening)
    screening.total_seats - screening.reserved_seats.count
  end
end
