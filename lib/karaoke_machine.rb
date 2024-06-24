


class KaraokeMachine
  SCALE = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

  attr_accessor :melody_arr

  def initialize(melody)
    @melody = melody
    @melody_arr = []
    @melody.each_char do |char|
      if char == "#"
        @melody_arr[-1] += "#"
      else
        @melody_arr << char
      end
    end
  end

  def transpose(level)
    melody_arr.map do |item|
      index = SCALE.find_index(item)
      !!index ? SCALE[(index + level) % SCALE.length ] : item
    end.join()
  end
end
