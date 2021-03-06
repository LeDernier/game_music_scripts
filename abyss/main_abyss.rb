# Abyss Ambiance

# Coded by Rémi Monthiller
# Adapted from Sam Aaron examples.

use_synth :zawa
use_bpm 40
use_random_seed 7
use_debug false

with_fx :reverb do
  with_fx(:echo, delay: 0.5, decay: 4) do
    live_loop :echoes do
      play chord([:c3, :d3, :e3, :g3].choose, :minor).choose, cutoff: rrand(40, 100), amp: 0.3, attack: 0, release: rrand(1, 2), cutoff_max: 110
      sleep [0.25, 0.25, 0.25, 0.5, 4].choose
    end
  end
end

with_fx :reverb do
  live_loop :choral do
    r = (ring 0.5, 1.0/3, 3.0/5, 1.0/5).choose
    8.times do
      sample :ambi_choir, amp: 4.0, rate: r, pan: rrand(-1, 1), cutoff: rrand(60, 110), sustain: rrand(0, 2), release: rrand(1, 5)
      sleep 0.3
    end
  end
end

live_loop :haunted do
  cue :perc
  sample :perc_bell, rate: rrand(-1.5, 1.5)
  sleep rrand(5, 10)
end
