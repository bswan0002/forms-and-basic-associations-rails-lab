class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.collect(&:content)
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end

end
