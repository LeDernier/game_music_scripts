# Creepy Pirates

# Coded by Rémi Monthiller
# Adapted from Sam Aaron examples.

# Creepy Abyss

# Coded by Rémi Monthiller
# Adapted from Sam Aaron examples.

use_debug false

live_loop :low do
  use_synth :pluck
  ns = [:e1, :e2, :f1, :f2].take(4)
  4.times do
    play ns.choose, release: 0.1, amp: 1, amp: rand + 0.5, cutoff: rrand(70, 120), amp: 2
    sleep [0.5, 0.25].choose
  end
end

with_fx :reverb, room: 0.5 do
  live_loop :bips, auto_cue: false do
    use_synth :piano
    use_random_seed 111
    ns = (scale :e2, :marva, num_octaves: 3).take(4)
    16.times do
      play ns.choose, detune: 35, release: 0.1, amp: 1.0, amp: rand + 0.5, cutoff: rrand(70, 120), amp: 2
      sleep [0.125, 0.25].choose
    end
  end
end

live_loop :rythm do
  use_random_seed 7
  32.times do
    use_synth :pretty_bell
    play chord(:e3, :minor).choose, amp: 3, attack: 0, release: 0.4
    sleep 0.125
  end
end

live_loop :vwoosh do
  sleep 0.25
  sample :ambi_swoosh, amp: 10.0, rate: [-2.0, -1.0, -0.5, 0.5, 1.0, 2.0].choose
  sleep 7.0
end