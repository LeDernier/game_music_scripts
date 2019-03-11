# Creepy Abyss

# Coded by Rémi Monthiller
# Adapted from Sam Aaron examples.

use_debug false

with_fx :reverb, mix: 0.2 do
  live_loop :oceans do
    use_synth :cnoise
    use_random_seed 7
    play chord([:c1, :d1, :e1].choose, :major).choose
    sleep 5.0
  end
end

live_loop :low do
  tick
  tick
  synth :pluck, wave: 1, phase: 0.25, release: 5, note: (knit :e1, 12, :c1, 4).look, cutoff: (line 60, 120, steps: 6).look
  sleep 4
end

with_fx :reverb, room: 1 do
  live_loop :lands, auto_cue: false do
    use_synth :supersaw
    use_random_seed 777
    ns = (scale :e2, :marva, num_octaves: 3).take(4)
    16.times do
      play ns.choose, detune: 35, release: 0.1, amp: 2, amp: rand + 0.5, cutoff: rrand(70, 120), amp: 2
      sleep [0.5, 0.25].choose
    end
  end
end


live_loop :fietsen do
  sleep 0.25
  sample :elec_blup, rate: -0.5
  sleep 7.75
end

live_loop :tijd do
  sample :bd_bloom, amp: 2.5, rate: 2.0, cutoff: 100
  sleep 1.0
end
