require 'spec_helper'
require 'karaoke_machine'

# melody = "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   "
# karaoke = KaraokeMachine.new(melody)
# karaoke.transpose(2)
# # => "D E F# G |F# E D   |F# G A B |A G F#   |D   D   |D   D   |DDEEF#F#GG|F# E D   "
# karaoke.transpose(-1)
# # => "B C# D# E |D# C# B   |D# E F# G# |F# E D#   |B   B   |B   B   |BBC#C#D#D#EE|D# C# B   "

# # 1オクターブ(12音)以上変えることもできる
# karaoke.transpose(12)
# # => "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   "
# karaoke.transpose(14)
# # => "D E F# G |F# E D   |F# G A B |A G F#   |D   D   |D   D   |DDEEF#F#GG|F# E D   "

# # ド以外の音から始まるメロディを使う場合もある
# melody = "F# G# A# B |A# G# F#   |A# B C# D# |C# B A#   |F#   F#   |F#   F#   |F#F#G#G#A#A#BB|A# G# F#   "
# karaoke = KaraokeMachine.new(melody)
# karaoke.transpose(6)
# # => "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   "
# karaoke.transpose(-6)
# # => "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   "

RSpec.describe KaraokeMachine do
  let(:melody) { "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   " }
  let(:karaoke) { KaraokeMachine.new(melody) }

  it 'melody_arrがでていること' do
    expect(karaoke.melody_arr).to eq ["C", " ", "D", " ", "E", " ", "F", " ", "|", "E", " ", "D", " ", "C", " ", " ", " ", "|", "E", " ", "F", " ", "G", " ", "A", " ", "|", "G", " ", "F", " ", "E", " ", " ", " ", "|", "C", " ", " ", " ", "C", " ", " ", " ", "|", "C", " ", " ", " ", "C", " ", " ", " ", "|", "C", "C", "D", "D", "E", "E", "F", "F", "|", "E", " ", "D", " ", "C", " ", " ", " "]
  end

  context "#transpose" do
    it 'キーが変わること' do
      expect(karaoke.transpose(2)).to eq "D E F# G |F# E D   |F# G A B |A G F#   |D   D   |D   D   |DDEEF#F#GG|F# E D   "
    end

    it '1オクターブ(12音)以上変えることもできること' do
      expect(karaoke.transpose(12)).to eq "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   "
    end

    context 'ド以外の音から始まるメロディの場合' do
      let(:melody) { "F# G# A# B |A# G# F#   |A# B C# D# |C# B A#   |F#   F#   |F#   F#   |F#F#G#G#A#A#BB|A# G# F#   " }
      it "キーが変わること" do
        expect(karaoke.transpose(6)).to eq "C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   "
      end
    end
  end



end
