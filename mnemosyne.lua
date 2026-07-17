-- title:   The Diamond of Mnemosyne
-- author:  Antigravity
-- desc:    Learn the Ancient Greek alphabet & pronunciation

-- PICO-8 Compatibility Helpers
local function rectfill(x0, y0, x1, y1, col)
  if x0 > x1 then x0, x1 = x1, x0 end
  if y0 > y1 then y0, y1 = y1, y0 end
  rect(x0, y0, x1 - x0 + 1, y1 - y0 + 1, col)
end

local function circfill(x, y, r, col)
  circ(x, y, r, col)
end

-- =====================================================================
-- GAME CONFIGURATION AND CHALLENGES
-- =====================================================================

local master_challenges = {
  -- ALPHA
  {
    name = "ALPHA (Upper)",
    glyph = "Alpha_upper",
    sound = "a",
    options = {"a", "e", "o", "i"},
    correct = 1,
    mnemonic = {
      "Uppercase Alpha (A)",
      "is a short/long vowel,",
      "makes 'ah' (as in father)."
    }
  },
  {
    name = "ALPHA (Lower)",
    glyph = "Alpha_lower",
    sound = "a",
    options = {"a", "e", "o", "i"},
    correct = 1,
    mnemonic = {
      "Lowercase alpha (a-like)",
      "is a short/long vowel,",
      "making an 'ah' sound."
    }
  },
  -- BETA
  {
    name = "BETA (Upper)",
    glyph = "Beta_upper",
    sound = "b",
    options = {"b", "v", "p", "m"},
    correct = 1,
    mnemonic = {
      "Uppercase Beta (B)",
      "is a voiced stop (b),",
      "makes 'b' (as in boat)."
    }
  },
  {
    name = "BETA (Lower)",
    glyph = "Beta_lower",
    sound = "b",
    options = {"b", "v", "p", "m"},
    correct = 1,
    mnemonic = {
      "Lowercase beta (b-like)",
      "is a voiced stop (b),",
      "making a standard 'b'."
    }
  },
  -- GAMMA
  {
    name = "GAMMA (Upper)",
    glyph = "Gamma_upper",
    sound = "g",
    options = {"g", "y", "k", "n"},
    correct = 1,
    mnemonic = {
      "Uppercase Gamma (G)",
      "is a voiced stop (g),",
      "making a hard 'g' (go)."
    }
  },
  {
    name = "GAMMA (Lower)",
    glyph = "Gamma_lower",
    sound = "g",
    options = {"g", "y", "k", "n"},
    correct = 1,
    mnemonic = {
      "Lowercase gamma (g-like)",
      "is a voiced stop (g),",
      "making a hard 'g' sound."
    }
  },
  -- DELTA
  {
    name = "DELTA (Upper)",
    glyph = "Delta_upper",
    sound = "d",
    options = {"d", "th", "t", "l"},
    correct = 1,
    mnemonic = {
      "Uppercase Delta",
      "is a voiced stop (d),",
      "making a standard 'd'."
    }
  },
  {
    name = "DELTA (Lower)",
    glyph = "Delta_lower",
    sound = "d",
    options = {"d", "th", "t", "l"},
    correct = 1,
    mnemonic = {
      "Lowercase delta (d-like)",
      "is a voiced stop (d),",
      "making a standard 'd'."
    }
  },
  -- EPSILON
  {
    name = "EPSILON (Upper)",
    glyph = "Epsilon_upper",
    sound = "e",
    options = {"e", "ee", "eh", "i"},
    correct = 1,
    mnemonic = {
      "Uppercase Epsilon (E)",
      "is a short vowel (e),",
      "makes short 'e' (pet)."
    }
  },
  {
    name = "EPSILON (Lower)",
    glyph = "Epsilon_lower",
    sound = "e",
    options = {"e", "ee", "eh", "i"},
    correct = 1,
    mnemonic = {
      "Lowercase epsilon",
      "is a short vowel (e),",
      "making a short 'e' sound."
    }
  },
  -- ZETA
  {
    name = "ZETA (Upper)",
    glyph = "Zeta_upper",
    sound = "zd",
    options = {"zd", "z", "ts", "d"},
    correct = 1,
    mnemonic = {
      "Uppercase Zeta (Z)",
      "is a voiced cluster,",
      "makes 'zd' (as in wisdom)."
    }
  },
  {
    name = "ZETA (Lower)",
    glyph = "Zeta_lower",
    sound = "zd",
    options = {"zd", "z", "ts", "d"},
    correct = 1,
    mnemonic = {
      "Lowercase zeta (z-like)",
      "is a voiced cluster,",
      "making a 'zd' sound."
    }
  },
  -- ETA
  {
    name = "ETA (Upper)",
    glyph = "Eta_upper",
    sound = "eh",
    options = {"ee", "h", "eh", "n"},
    correct = 3,
    mnemonic = {
      "Uppercase Eta (H)",
      "is a long open vowel,",
      "makes long 'eh' (care)."
    }
  },
  {
    name = "ETA (Lower)",
    glyph = "Eta_lower",
    sound = "eh",
    options = {"ee", "h", "eh", "n"},
    correct = 3,
    mnemonic = {
      "Lowercase eta (n-like)",
      "is a long open vowel,",
      "making a long 'eh' sound."
    }
  },
  -- THETA
  {
    name = "THETA (Upper)",
    glyph = "Theta_upper",
    sound = "t-h",
    options = {"t", "p-h", "k-h", "t-h"},
    correct = 4,
    mnemonic = {
      "Uppercase Theta (O-belt)",
      "voiceless aspirated 't',",
      "makes aspirated 't' (top)."
    }
  },
  {
    name = "THETA (Lower)",
    glyph = "Theta_lower",
    sound = "t-h",
    options = {"t", "p-h", "k-h", "t-h"},
    correct = 4,
    mnemonic = {
      "Lowercase theta (o-belt)",
      "voiceless aspirated 't',",
      "makes aspirated 't' (top)."
    }
  },
  -- IOTA
  {
    name = "IOTA (Upper)",
    glyph = "Iota_upper",
    sound = "i",
    options = {"i", "ee", "y", "j"},
    correct = 1,
    mnemonic = {
      "Uppercase Iota (I)",
      "is a short/long vowel,",
      "makes 'ee' (machine)."
    }
  },
  {
    name = "IOTA (Lower)",
    glyph = "Iota_lower",
    sound = "i",
    options = {"i", "ee", "y", "j"},
    correct = 1,
    mnemonic = {
      "Lowercase iota",
      "is a short/long vowel,",
      "making an 'ee' sound."
    }
  },
  -- KAPPA
  {
    name = "KAPPA (Upper)",
    glyph = "Kappa_upper",
    sound = "k",
    options = {"k", "k-h", "s", "c"},
    correct = 1,
    mnemonic = {
      "Uppercase Kappa (K)",
      "voiceless unaspirated 'k',",
      "makes plain 'k' (skin)."
    }
  },
  {
    name = "KAPPA (Lower)",
    glyph = "Kappa_lower",
    sound = "k",
    options = {"k", "k-h", "s", "c"},
    correct = 1,
    mnemonic = {
      "Lowercase kappa",
      "voiceless unaspirated 'k',",
      "making a plain 'k' sound."
    }
  },
  -- LAMBDA
  {
    name = "LAMBDA (Upper)",
    glyph = "Lambda_upper",
    sound = "l",
    options = {"l", "y", "r", "d"},
    correct = 1,
    mnemonic = {
      "Uppercase Lambda",
      "is a voiced liquid (l),",
      "making an 'l' sound."
    }
  },
  {
    name = "LAMBDA (Lower)",
    glyph = "Lambda_lower",
    sound = "l",
    options = {"l", "y", "r", "d"},
    correct = 1,
    mnemonic = {
      "Lowercase lambda",
      "is a voiced liquid (l),",
      "making an 'l' sound."
    }
  },
  -- MU
  {
    name = "MU (Upper)",
    glyph = "Mu_upper",
    sound = "m",
    options = {"m", "n", "u", "b"},
    correct = 1,
    mnemonic = {
      "Uppercase Mu (M)",
      "is a voiced nasal (m),",
      "making standard 'm' sound."
    }
  },
  {
    name = "MU (Lower)",
    glyph = "Mu_lower",
    sound = "m",
    options = {"m", "n", "u", "b"},
    correct = 1,
    mnemonic = {
      "Lowercase mu (u-like)",
      "is a voiced nasal (m),",
      "making standard 'm' sound."
    }
  },
  -- NU
  {
    name = "NU (Upper)",
    glyph = "Nu_upper",
    sound = "n",
    options = {"n", "v", "m", "u"},
    correct = 1,
    mnemonic = {
      "Uppercase Nu (N)",
      "is a voiced nasal (n),",
      "making standard 'n' sound."
    }
  },
  {
    name = "NU (Lower)",
    glyph = "Nu_lower",
    sound = "n",
    options = {"n", "v", "m", "u"},
    correct = 1,
    mnemonic = {
      "Lowercase nu (v-like)",
      "is a voiced nasal (n),",
      "making standard 'n' sound."
    }
  },
  -- XI
  {
    name = "XI (Upper)",
    glyph = "Xi_upper",
    sound = "x",
    options = {"x", "z", "ps", "kh"},
    correct = 1,
    mnemonic = {
      "Uppercase Xi (lines)",
      "voiceless cluster (ks),",
      "making 'ks' sound (box)."
    }
  },
  {
    name = "XI (Lower)",
    glyph = "Xi_lower",
    sound = "x",
    options = {"x", "z", "ps", "kh"},
    correct = 1,
    mnemonic = {
      "Lowercase xi (curly)",
      "voiceless cluster (ks),",
      "making 'ks' sound (box)."
    }
  },
  -- OMICRON
  {
    name = "OMICRON (Upper)",
    glyph = "Omicron_upper",
    sound = "o",
    options = {"o", "oh", "oo", "aw"},
    correct = 1,
    mnemonic = {
      "Uppercase Omicron (O)",
      "is a short vowel (o),",
      "makes short 'o' (pot)."
    }
  },
  {
    name = "OMICRON (Lower)",
    glyph = "Omicron_lower",
    sound = "o",
    options = {"o", "oh", "oo", "aw"},
    correct = 1,
    mnemonic = {
      "Lowercase omicron",
      "is a short vowel (o),",
      "making short 'o' sound."
    }
  },
  -- PI
  {
    name = "PI (Upper)",
    glyph = "Pi_upper",
    sound = "p",
    options = {"p", "p-h", "f", "b"},
    correct = 1,
    mnemonic = {
      "Uppercase Pi (arch)",
      "voiceless unaspirated 'p',",
      "makes plain 'p' (spin)."
    }
  },
  {
    name = "PI (Lower)",
    glyph = "Pi_lower",
    sound = "p",
    options = {"p", "p-h", "f", "b"},
    correct = 1,
    mnemonic = {
      "Lowercase pi (math pi)",
      "voiceless unaspirated 'p',",
      "making a plain 'p' sound."
    }
  },
  -- RHO
  {
    name = "RHO (Upper)",
    glyph = "Rho_upper",
    sound = "r",
    options = {"p", "r", "b", "p-h"},
    correct = 2,
    mnemonic = {
      "Uppercase Rho (P)",
      "is a voiced trill (r),",
      "makes rolled 'r' (rose)."
    }
  },
  {
    name = "RHO (Lower)",
    glyph = "Rho_lower",
    sound = "r",
    options = {"p", "r", "b", "p-h"},
    correct = 2,
    mnemonic = {
      "Lowercase rho (p-like)",
      "is a voiced trill (r),",
      "making a rolled 'r' sound."
    }
  },
  -- SIGMA
  {
    name = "SIGMA (Upper)",
    glyph = "Sigma_upper",
    sound = "s",
    options = {"s", "z", "sh", "x"},
    correct = 1,
    mnemonic = {
      "Uppercase Sigma",
      "voiceless sibilant (s),",
      "making standard 's' sound."
    }
  },
  {
    name = "SIGMA (Lower)",
    glyph = "Sigma_lower",
    sound = "s",
    options = {"s", "z", "sh", "x"},
    correct = 1,
    mnemonic = {
      "Lowercase sigma (o-tail)",
      "voiceless sibilant (s),",
      "making standard 's' sound."
    }
  },
  -- TAU
  {
    name = "TAU (Upper)",
    glyph = "Tau_upper",
    sound = "t",
    options = {"t", "t-h", "d", "th"},
    correct = 1,
    mnemonic = {
      "Uppercase Tau (T)",
      "voiceless unaspirated 't',",
      "makes plain 't' (stop)."
    }
  },
  {
    name = "TAU (Lower)",
    glyph = "Tau_lower",
    sound = "t",
    options = {"t", "t-h", "d", "th"},
    correct = 1,
    mnemonic = {
      "Lowercase tau (t-like)",
      "voiceless unaspirated 't',",
      "making plain 't' (stop)."
    }
  },
  -- UPSILON
  {
    name = "UPSILON (Upper)",
    glyph = "Upsilon_upper",
    sound = "y",
    options = {"y", "u", "ee", "w"},
    correct = 1,
    mnemonic = {
      "Uppercase Upsilon (Y)",
      "front rounded vowel (y),",
      "makes French 'u' (ü)."
    }
  },
  {
    name = "UPSILON (Lower)",
    glyph = "Upsilon_lower",
    sound = "y",
    options = {"y", "u", "ee", "w"},
    correct = 1,
    mnemonic = {
      "Lowercase upsilon",
      "front rounded vowel (y),",
      "makes French 'u' (ü)."
    }
  },
  -- PHI
  {
    name = "PHI (Upper)",
    glyph = "Phi_upper",
    sound = "p-h",
    options = {"p", "p-h", "f", "t-h"},
    correct = 2,
    mnemonic = {
      "Uppercase Phi (O-split)",
      "voiceless aspirated 'p',",
      "makes aspirated 'p' (pot)."
    }
  },
  {
    name = "PHI (Lower)",
    glyph = "Phi_lower",
    sound = "p-h",
    options = {"p", "p-h", "f", "t-h"},
    correct = 2,
    mnemonic = {
      "Lowercase phi (o-split)",
      "voiceless aspirated 'p',",
      "makes aspirated 'p' (pot)."
    }
  },
  -- CHI
  {
    name = "CHI (Upper)",
    glyph = "Chi_upper",
    sound = "k-h",
    options = {"k-h", "k", "ps", "t-h"},
    correct = 1,
    mnemonic = {
      "Uppercase Chi (X)",
      "voiceless aspirated 'k',",
      "makes aspirated 'k' (cool)"
    }
  },
  {
    name = "CHI (Lower)",
    glyph = "Chi_lower",
    sound = "k-h",
    options = {"k-h", "k", "ps", "t-h"},
    correct = 1,
    mnemonic = {
      "Lowercase chi (x-like)",
      "voiceless aspirated 'k',",
      "makes aspirated 'k' (cool)"
    }
  },
  -- PSI
  {
    name = "PSI (Upper)",
    glyph = "Psi_upper",
    sound = "ps",
    options = {"ps", "p", "s", "p-h"},
    correct = 1,
    mnemonic = {
      "Uppercase Psi",
      "voiceless cluster (ps),",
      "making a sharp 'ps' sound."
    }
  },
  {
    name = "PSI (Lower)",
    glyph = "Psi_lower",
    sound = "ps",
    options = {"ps", "p", "s", "p-h"},
    correct = 1,
    mnemonic = {
      "Lowercase psi (trident)",
      "voiceless cluster (ps),",
      "making a sharp 'ps' sound."
    }
  },
  -- OMEGA
  {
    name = "OMEGA (Upper)",
    glyph = "Omega_upper",
    sound = "aw",
    options = {"aw", "oh", "oo", "o"},
    correct = 1,
    mnemonic = {
      "Uppercase Omega",
      "is a long open vowel,",
      "makes long 'aw' (saw)."
    }
  },
  {
    name = "OMEGA (Lower)",
    glyph = "Omega_lower",
    sound = "aw",
    options = {"aw", "oh", "oo", "o"},
    correct = 1,
    mnemonic = {
      "Lowercase omega",
      "is a long open vowel,",
      "makes long 'aw' (saw)."
    }
  }
}

local challenges = {}

-- False Friend Triage Glyphs (Greek vs Latin)
-- Left = Greek, Right = Latin
local triage_challenges = {
  {char = "P", sound = "/r/", type = "G", desc = "Greek Rho"},
  {char = "P", sound = "/p/", type = "L", desc = "Latin P"},
  {char = "H", sound = "/eh/", type = "G", desc = "Greek Eta"},
  {char = "H", sound = "/h/", type = "L", desc = "Latin H"},
  {char = "X", sound = "/k-h/", type = "G", desc = "Greek Chi"},
  {char = "X", sound = "/x/", type = "L", desc = "Latin X"},
  {char = "v", sound = "/n/", type = "G", desc = "Greek Nu"},
  {char = "v", sound = "/v/", type = "L", desc = "Latin V"},
  {char = "w", sound = "/aw/", type = "G", desc = "Greek Omega"},
  {char = "w", sound = "/w/", type = "L", desc = "Latin W"},
  {char = "u", sound = "/y/", type = "G", desc = "Greek Upsilon"},
  {char = "u", sound = "/u/", type = "L", desc = "Latin U"}
}

local active_triage_list = {}

-- Shuffling helper for triage cards
local function shuffle_triage()
  active_triage_list = {}
  -- Create shallow copy
  for i = 1, #triage_challenges do
    active_triage_list[i] = triage_challenges[i]
  end
  -- Shuffle
  local n = #active_triage_list
  for i = n, 2, -1 do
    local j = math.random(i)
    active_triage_list[i], active_triage_list[j] = active_triage_list[j], active_triage_list[i]
  end
end

-- =====================================================================
-- GAME STATE MACHINE AND GLOBAL VARIABLES
-- =====================================================================

local STATE_TITLE = 0
local STATE_SHRINE = 1
local STATE_BATTLE = 2
local STATE_TRIAGE_INT = 3
local STATE_TRIAGE = 4
local STATE_GAMEOVER = 5
local STATE_VICTORY = 6
local STATE_DICTIONARY = 7

local current_state = STATE_TITLE
local current_challenge_idx = 1
local player_lives = 3
local score = 0
local skip_tutorials = false
local dict_idx = 1

-- Triage round variables
local triage_idx = 1
local triage_score = 0
local triage_timer = 0
local triage_max_timer = 90 -- 1.5 seconds at 60 FPS
local triage_flash_time = 0
local triage_flash_msg = ""
local triage_flash_col = 12

-- Delay timers for battle results
local battle_delay_timer = 0
local battle_status = "idle" -- "idle", "correct", "incorrect"
local battle_selected_idx = 0

-- Visual Juice variables
local shake_intensity = 0
local particles = {}
local stars = {}

-- Transition system
local transition_active = false
local transition_timer = 0
local transition_to_state = STATE_TITLE

local function trigger_transition(target_state)
  transition_active = true
  transition_timer = 30
  transition_to_state = target_state
end

local function trigger_shake(intensity)
  shake_intensity = intensity
end

-- =====================================================================
-- SFX SYSTEM (Uses TIC-80 standard sound chip)
-- =====================================================================

-- Plays sound effect using wave channel index
-- sfx(id, note, duration, channel, volume, speed)
local function play_success()
  sfx(0, 52, 15, 0, 12, 0) -- Square wave, high pitch chime (E-5)
end

local function play_failure()
  sfx(0, 24, 25, 0, 12, 0) -- Square wave, low pitch buzz (C-3)
end

local function play_select()
  sfx(0, 40, 4, 1, 10, 0) -- Square wave, short tick (C-4)
end

-- =====================================================================
-- PARTICLE & STARFIELD SYSTEMS
-- =====================================================================

local function init_stars()
  stars = {}
  for i = 1, 35 do
    table.insert(stars, {
      x = math.random(240),
      y = math.random(136),
      speed = 0.15 + math.random() * 0.45,
      col = math.random() > 0.5 and 13 or 14 -- Periwinkle Gray (13) or Slate Blue (14)
    })
  end
end

local function update_stars()
  for i = 1, #stars do
    local s = stars[i]
    s.y = s.y + s.speed
    if s.y > 136 then
      s.y = 0
      s.x = math.random(240)
    end
  end
end

local function draw_stars()
  for i = 1, #stars do
    local s = stars[i]
    pix(s.x, s.y, s.col)
  end
end

local function spawn_particles(x, y, count)
  for i = 1, count do
    local angle = math.random() * math.pi * 2
    local speed = 0.6 + math.random() * 2.2
    table.insert(particles, {
      x = x,
      y = y,
      dx = math.cos(angle) * speed,
      dy = math.sin(angle) * speed,
      life = 20 + math.random(15),
      col = math.random() > 0.5 and 6 or 4 -- Green (6) or Gold (4)
    })
  end
end

local function update_particles()
  for i = #particles, 1, -1 do
    local p = particles[i]
    p.x = p.x + p.dx
    p.y = p.y + p.dy
    p.life = p.life - 1
    if p.life <= 0 then
      table.remove(particles, i)
    end
  end
end

local function draw_particles()
  for i = 1, #particles do
    local p = particles[i]
    if p.life > 10 then
      circb(p.x, p.y, 1, p.col)
    else
      pix(p.x, p.y, p.col)
    end
  end
end

-- =====================================================================
-- PROCEDURAL RENDERING SYSTEM (No Sprites Needed)
-- =====================================================================

-- Center-aligned print helper
local function draw_text_centered(str, x, y, col, scale)
  scale = scale or 1
  local width = #str * 6 * scale
  print(str, x - width / 2, y, col, false, scale)
end

-- Draws classical marble temple columns on left and right sides
local function draw_temple_columns()
  -- Left Column (x=10 to x=22)
  rectfill(8, 125, 24, 130, 14) -- shadow base
  rectfill(6, 120, 22, 125, 12) -- base lower tier
  rectfill(8, 115, 20, 120, 12) -- base upper tier
  rectfill(8, 10, 20, 15, 12)   -- capital top
  rectfill(6, 15, 22, 20, 12)   -- capital bottom
  rectfill(10, 20, 18, 115, 12) -- shaft
  line(12, 20, 12, 115, 14)     -- fluting 1
  line(15, 20, 15, 115, 14)     -- fluting 2
  line(17, 20, 17, 115, 14)     -- fluting 3

  -- Right Column (x=218 to x=230)
  rectfill(216, 125, 232, 130, 14) -- shadow base
  rectfill(218, 120, 234, 125, 12) -- base lower tier
  rectfill(220, 115, 232, 120, 12) -- base upper tier
  rectfill(220, 10, 232, 15, 12)   -- capital top
  rectfill(218, 15, 234, 20, 12)   -- capital bottom
  rectfill(222, 20, 230, 115, 12) -- shaft
  line(224, 20, 224, 115, 14)     -- fluting 1
  line(227, 20, 227, 115, 14)     -- fluting 2
  line(229, 20, 229, 115, 14)     -- fluting 3
end

-- Draws wireframe 3D diamond shape for the title screen
local function draw_diamond_logo(x, y, r, col)
  line(x, y - r, x + r, y, col)
  line(x + r, y, x, y + r, col)
  line(x, y + r, x - r, y, col)
  line(x - r, y, x, y - r, col)
  -- Facets
  line(x, y - r, x, y + r, col)
  line(x - r, y, x + r, y, col)
  line(x - r/2, y - r/2, x + r/2, y + r/2, col)
  line(x + r/2, y - r/2, x - r/2, y + r/2, col)
end

-- Procedurally renders a heart icon (7x6 pixels)
local function draw_heart(x, y, filled)
  local col = filled and 2 or 14 -- Red (2) or Gray (14)
  rectfill(x + 1, y, x + 2, y, col)
  rectfill(x + 4, y, x + 5, y, col)
  rectfill(x, y + 1, x + 6, y + 1, col)
  rectfill(x, y + 2, x + 6, y + 2, col)
  rectfill(x + 1, y + 3, x + 5, y + 3, col)
  rectfill(x + 2, y + 4, x + 4, y + 4, col)
  pix(x + 3, y + 5, col)
end

local GREEK_FONT_PIXELS = {
  Alpha_lower = {2, 10, 22, 18, 13},
  Alpha_upper = {7, 9, 17, 31, 17},
  Beta_lower = { y_start = 0, pixels = {6, 9, 14, 9, 14, 8} },
  Beta_upper = {30, 17, 30, 17, 30},
  Chi_lower = {18, 10, 4, 10, 9},
  Chi_upper = {17, 10, 4, 10, 17},
  Delta_lower = { y_start = -1, pixels = {6, 9, 4, 14, 18, 12} },
  Delta_upper = {4, 10, 10, 17, 31},
  Epsilon_lower = {15, 16, 14, 16, 15},
  Epsilon_upper = {31, 16, 30, 16, 31},
  Eta_lower = { y_start = 0, pixels = {22, 25, 17, 17, 17, 1} },
  Eta_upper = {17, 17, 31, 17, 17},
  Gamma_lower = {17, 10, 12, 8, 8},
  Gamma_upper = {31, 16, 16, 16, 16},
  Iota_lower = {4, 0, 4, 4, 4},
  Iota_upper = {31, 4, 4, 4, 31},
  Kappa_lower = {10, 10, 12, 12, 10},
  Kappa_upper = {17, 18, 28, 18, 17},
  Lambda_lower = {24, 4, 4, 12, 19},
  Lambda_upper = {4, 10, 10, 17, 17},
  Mu_lower = {18, 18, 18, 29, 16},
  Mu_upper = {17, 27, 21, 17, 17},
  Nu_lower = {17, 17, 9, 10, 4},
  Nu_upper = {17, 25, 21, 19, 17},
  Omega_lower = {10, 17, 21, 21, 10},
  Omega_upper = {14, 17, 17, 10, 27},
  Omicron_lower = {14, 17, 17, 17, 14},
  Omicron_upper = {14, 17, 17, 17, 14},
  Phi_lower = {4, 14, 21, 14, 4},
  Phi_upper = {14, 21, 21, 14, 4},
  Pi_lower = {31, 10, 10, 10, 10},
  Pi_upper = {31, 17, 17, 17, 17},
  Psi_lower = {18, 21, 21, 14, 4},
  Psi_upper = {21, 21, 21, 14, 4},
  Rho_lower = {6, 9, 14, 8, 8},
  Rho_upper = {30, 17, 17, 30, 16},
  Sigma_lower = {15, 18, 18, 18, 12},
  Sigma_upper = {31, 8, 4, 8, 31},
  Tau_lower = {15, 20, 4, 4, 2},
  Tau_upper = {31, 4, 4, 4, 4},
  Theta_lower = {14, 17, 31, 17, 14},
  Theta_upper = {14, 17, 31, 17, 14},
  Upsilon_lower = {18, 17, 17, 17, 14},
  Upsilon_upper = {17, 10, 4, 4, 4},
  Xi_lower = { y_start = 0, pixels = {6, 8, 6, 8, 7, 1} },
  Xi_upper = {31, 0, 31, 0, 31},
  Zeta_lower = {15, 2, 4, 7, 1},
  Zeta_upper = {31, 2, 4, 8, 31},
}

local function draw_greek_letter(name, x, y, col, s)
  s = s or 1
  s = math.max(1, math.floor(s + 0.5)) -- Force integer scaling to avoid distortion
  local glyph = GREEK_FONT_PIXELS[name]
  if glyph then
    local y_start_offset = 0
    local pixels = glyph
    if glyph.pixels then
      y_start_offset = glyph.y_start
      pixels = glyph.pixels
    end

    local x_start = x - 2 * s - math.floor(s / 2)
    local y_start = y - 2 * s - math.floor(s / 2) + y_start_offset * s
    for dy = 0, #pixels - 1 do
      local row_val = pixels[dy + 1]
      local py = y_start + dy * s
      for dx = 0, 4 do
        local bit = (row_val >> (4 - dx)) & 1
        if bit == 1 then
          local px = x_start + dx * s
          rectfill(px, py, px + s - 1, py + s - 1, col)
        end
      end
    end
  end
end

-- Draws look-alike glyphs for False Friend Triage centered at (x, y) with scale
local function draw_triage_glyph(name, x, y, col, s)
  s = s or 1
  if name == "P" then
    line(x - 3*s, y - 7*s, x - 3*s, y + 7*s, col)
    line(x - 2*s, y - 7*s, x - 2*s, y + 7*s, col) -- thicker stem
    line(x - 2*s, y - 7*s, x + 3*s, y - 7*s, col)
    line(x - 2*s, y - 1*s, x + 3*s, y - 1*s, col)
    line(x + 3*s, y - 6*s, x + 3*s, y - 2*s, col)
    line(x + 4*s, y - 6*s, x + 4*s, y - 2*s, col)
  elseif name == "H" then
    line(x - 4*s, y - 7*s, x - 4*s, y + 7*s, col)
    line(x - 3*s, y - 7*s, x - 3*s, y + 7*s, col)
    line(x + 3*s, y - 7*s, x + 3*s, y + 7*s, col)
    line(x + 4*s, y - 7*s, x + 4*s, y + 7*s, col)
    line(x - 2*s, y, x + 2*s, y, col)
    line(x - 2*s, y + 1, x + 2*s, y + 1, col)
  elseif name == "X" then
    line(x - 6*s, y - 6*s, x + 6*s, y + 6*s, col)
    line(x - 5*s, y - 6*s, x + 7*s, y + 6*s, col)
    line(x + 6*s, y - 6*s, x - 6*s, y + 6*s, col)
    line(x + 5*s, y - 6*s, x - 7*s, y + 6*s, col)
  elseif name == "v" then
    line(x - 5*s, y - 5*s, x, y + 5*s, col)
    line(x - 4*s, y - 5*s, x, y + 5*s, col)
    line(x, y + 5*s, x + 5*s, y - 5*s, col)
    line(x, y + 5*s, x + 6*s, y - 5*s, col)
  elseif name == "w" then
    line(x - 6*s, y - 3*s, x - 4*s, y + 3*s, col)
    line(x - 4*s, y + 3*s, x - 1*s, y - 3*s, col)
    line(x - 1*s, y - 3*s, x + 2*s, y + 3*s, col)
    line(x + 2*s, y + 3*s, x + 4*s, y - 3*s, col)
  elseif name == "u" then
    line(x - 4*s, y - 4*s, x - 4*s, y + 2*s, col)
    line(x - 4*s, y + 2*s, x + 2*s, y + 2*s, col)
    line(x + 2*s, y - 4*s, x + 2*s, y + 4*s, col)
  end
end

-- Procedurally renders the battle monster (an animated Cyclops)
local function draw_battle_monster(tx, ty, t, state_col)
  -- Breathing bobbing
  local bob = math.sin(t / 150) * 1.8

  -- Body (Dark Teal / Navy)
  rectfill(tx - 18, ty + 12 + bob, tx + 18, ty + 35 + bob, 7)
  rectfill(tx - 15, ty + 12 + bob, tx + 15, ty + 35 + bob, 8) -- shading
  -- Shines/highlights
  line(tx - 18, ty + 15 + bob, tx - 18, ty + 30 + bob, 14)

  -- Shoulders/Arms
  circfill(tx - 19, ty + 16 + bob, 4, 7)
  circfill(tx + 19, ty + 16 + bob, 4, 7)
  rectfill(tx - 22, ty + 16 + bob, tx - 17, ty + 28 + bob, 7)
  rectfill(tx + 17, ty + 16 + bob, tx + 22, ty + 28 + bob, 7)

  -- Head
  circfill(tx, ty + bob, 11, 7)
  circfill(tx, ty + bob, 9, 8) -- inner shadow

  -- Horns
  line(tx - 8, ty - 6 + bob, tx - 13, ty - 13 + bob, 12)
  line(tx + 8, ty - 6 + bob, tx + 13, ty - 13 + bob, 12)
  line(tx - 7, ty - 6 + bob, tx - 12, ty - 13 + bob, 14)
  line(tx + 7, ty - 6 + bob, tx + 12, ty - 13 + bob, 14)

  -- Glowing Cyclops Eye
  circfill(tx, ty + bob, 5, 12) -- white sclera
  local eye_w = 2 + math.sin(t/300)*1.5
  -- Glowing pupil based on incorrect state
  local eye_col = (state_col == 2) and 2 or 4 -- Red pupil if hurt, else Gold
  circfill(tx, ty + bob, 2, eye_col)

  -- Eye blink (every 4 seconds, close eye for 8 frames)
  if (math.floor(t / 60) % 4 == 0) and (math.floor(t) % 60 < 8) then
    line(tx - 5, ty + bob, tx + 5, ty + bob, 7) -- eyelid closure
  end
end

-- =====================================================================
-- INITIALIZATION
-- =====================================================================

local function prepare_challenge(original)
  -- Create a copy of the challenge table
  local copy = {
    name = original.name,
    glyph = original.glyph,
    sound = original.sound,
    correct = original.correct,
    mnemonic = original.mnemonic
  }
  
  -- Create a copy of the options array
  local original_options = original.options
  local correct_val = original_options[original.correct]
  
  local options = {}
  for i = 1, #original_options do
    options[i] = original_options[i]
  end
  
  -- Fisher-Yates shuffle for options
  for i = #options, 2, -1 do
    local j = math.random(i)
    options[i], options[j] = options[j], options[i]
  end
  
  -- Find new correct index
  local new_correct = 1
  for i = 1, #options do
    if options[i] == correct_val then
      new_correct = i
      break
    end
  end
  
  copy.options = options
  copy.correct = new_correct
  return copy
end

local function init_game()
  math.randomseed(time())
  current_challenge_idx = 1
  player_lives = 3
  score = 0
  init_stars()
  particles = {}
  battle_status = "idle"
  battle_delay_timer = 0

  -- Select 8 random challenges from master_challenges for this run
  challenges = {}
  local temp_pool = {}
  for i = 1, #master_challenges do
    temp_pool[i] = master_challenges[i]
  end
  for i = 1, 8 do
    local idx = math.random(#temp_pool)
    local prepared = prepare_challenge(temp_pool[idx])
    table.insert(challenges, prepared)
    table.remove(temp_pool, idx)
  end
end

-- =====================================================================
-- STATE UPDATE LOGIC
-- =====================================================================

local function update_game()
  -- Tick particle and star systems
  update_stars()
  update_particles()

  -- Handle transition state changes
  if transition_active then
    transition_timer = transition_timer - 1
    if transition_timer == 15 then
      current_state = transition_to_state
      -- Trigger any state startup scripts
      if current_state == STATE_TRIAGE_INT or (current_state == STATE_TRIAGE and skip_tutorials and triage_idx == 1) then
        shuffle_triage()
      elseif current_state == STATE_TITLE then
        init_game()
      end
    end
    if transition_timer <= 0 then
      transition_active = false
    end
    return -- Freeze inputs during transitions
  end

  -- Tick screens
  if current_state == STATE_TITLE then
    if btnp(4) then
      skip_tutorials = false
      play_select()
      trigger_transition(STATE_SHRINE)
    elseif btnp(5) then
      skip_tutorials = true
      play_select()
      trigger_transition(STATE_BATTLE)
      battle_status = "idle"
      battle_delay_timer = 0
      battle_selected_idx = 0
    elseif btnp(6) then
      play_select()
      dict_idx = 1
      trigger_transition(STATE_DICTIONARY)
    end

  elseif current_state == STATE_SHRINE then
    -- Any action button proceeds to battle
    if btnp(4) or btnp(5) or btnp(6) or btnp(7) then
      play_select()
      trigger_transition(STATE_BATTLE)
      battle_status = "idle"
      battle_delay_timer = 0
      battle_selected_idx = 0
    end

  elseif current_state == STATE_BATTLE then
    local challenge = challenges[current_challenge_idx]

    -- In delay freeze
    if battle_delay_timer > 0 then
      battle_delay_timer = battle_delay_timer - 1
      if battle_delay_timer == 0 then
        if battle_status == "correct" then
          -- Advance or go to Triage
          if current_challenge_idx < #challenges then
            current_challenge_idx = current_challenge_idx + 1
            if skip_tutorials then
              trigger_transition(STATE_BATTLE)
              battle_status = "idle"
              battle_delay_timer = 0
              battle_selected_idx = 0
            else
              trigger_transition(STATE_SHRINE)
            end
          else
            if skip_tutorials then
              trigger_transition(STATE_TRIAGE)
              triage_idx = 1
              triage_score = 0
              triage_timer = triage_max_timer
              triage_flash_time = 0
            else
              trigger_transition(STATE_TRIAGE_INT)
            end
          end
        elseif battle_status == "incorrect" then
          if player_lives <= 0 then
            trigger_transition(STATE_GAMEOVER)
          else
            -- Recover to let player try again
            battle_status = "idle"
            battle_selected_idx = 0
          end
        end
      end
    else
      -- Check Diamond Menu Input
      -- Up Arrow (0) or X Button (6) -> Option 1
      -- Left Arrow (2) or Y Button (7) -> Option 2
      -- Right Arrow (3) or A Button (4) -> Option 3
      -- Down Arrow (1) or B Button (5) -> Option 4
      local selected_idx = 0
      if btnp(0) or btnp(6) then selected_idx = 1 end
      if btnp(2) or btnp(7) then selected_idx = 2 end
      if btnp(3) or btnp(4) then selected_idx = 3 end
      if btnp(1) or btnp(5) then selected_idx = 4 end

      if selected_idx > 0 then
        battle_selected_idx = selected_idx
        if selected_idx == challenge.correct then
          -- Correct!
          play_success()
          score = score + 100
          battle_status = "correct"
          battle_delay_timer = 45 -- 0.75s delay
          -- Spawn particles at selected option position
          local px, py = 120, 98
          if selected_idx == 1 then py = 70
          elseif selected_idx == 2 then px = 90
          elseif selected_idx == 3 then px = 150
          elseif selected_idx == 4 then py = 122 end
          spawn_particles(px, py, 20)
        else
          -- Incorrect!
          play_failure()
          trigger_shake(8)
          player_lives = player_lives - 1
          battle_status = "incorrect"
          battle_delay_timer = 60 -- 1s delay (gives time to see error)
        end
      end
    end

  elseif current_state == STATE_TRIAGE_INT then
    -- Any button starts triage round
    for i = 0, 7 do
      if btnp(i) then
        play_select()
        triage_idx = 1
        triage_score = 0
        triage_timer = triage_max_timer
        triage_flash_time = 0
        trigger_transition(STATE_TRIAGE)
        break
      end
    end

  elseif current_state == STATE_TRIAGE then
    local active_triage = active_triage_list[triage_idx]

    if triage_flash_time > 0 then
      triage_flash_time = triage_flash_time - 1
      if triage_flash_time == 0 then
        -- Proceed to next triage or Victory
        if triage_idx < 10 then
          triage_idx = triage_idx + 1
          triage_timer = triage_max_timer
        else
          trigger_transition(STATE_VICTORY)
        end
      end
    else
      -- Decrement timer
      triage_timer = triage_timer - 1
      if triage_timer <= 0 then
        -- Timeout
        play_failure()
        trigger_shake(8)
        triage_flash_msg = "TIMEOUT! It's " .. active_triage.desc
        triage_flash_col = 2
        triage_flash_time = 60
      else
        -- Check Left (Greek) vs Right (Latin)
        -- Left: D-pad Left (2) or Y face button (7)
        -- Right: D-pad Right (3) or A face button (4)
        local choice = ""
        if btnp(2) or btnp(7) then choice = "G" end
        if btnp(3) or btnp(4) then choice = "L" end

        if choice ~= "" then
          if choice == active_triage.type then
            -- Correct!
            play_success()
            score = score + 100
            triage_score = triage_score + 1
            triage_flash_msg = "CORRECT! " .. active_triage.desc
            triage_flash_col = 6
            triage_flash_time = 40
            spawn_particles(120, 58, 15)
          else
            -- Wrong!
            play_failure()
            trigger_shake(8)
            triage_flash_msg = "WRONG! It's " .. active_triage.desc
            triage_flash_col = 2
            triage_flash_time = 60
          end
        end
      end
    end

  elseif current_state == STATE_GAMEOVER or current_state == STATE_VICTORY then
    -- Press any button to reset to Title screen
    for i = 0, 7 do
      if btnp(i) then
        play_select()
        trigger_transition(STATE_TITLE)
        break
      end
    end
  elseif current_state == STATE_DICTIONARY then
    if btnp(2) then
      play_select()
      dict_idx = dict_idx - 1
      if dict_idx < 1 then dict_idx = #master_challenges end
    elseif btnp(3) then
      play_select()
      dict_idx = dict_idx + 1
      if dict_idx > #master_challenges then dict_idx = 1 end
    elseif btnp(5) then
      play_select()
      trigger_transition(STATE_TITLE)
    end
  end
end

-- =====================================================================
-- STATE RENDERING LOGIC
-- =====================================================================

local function draw_game()
  cls(0) -- Clear to Dark Blue/Black background
  draw_stars()

  if current_state == STATE_TITLE then
    -- Pulsing central logo diamond
    local pulse = math.sin(time() / 350) * 4
    draw_diamond_logo(120, 60, 38 + pulse, 14)
    draw_diamond_logo(120, 60, 42 + pulse, 11) -- glowing cyan border

    draw_temple_columns()

    -- Title texts
    draw_text_centered("THE DIAMOND", 120, 38, 12, 2)
    draw_text_centered("OF", 120, 56, 13, 1)
    draw_text_centered("MNEMOSYNE", 120, 66, 4, 2)

    -- Instructions
    draw_text_centered("Ancient Greek Mnemonic practice", 120, 92, 13, 1)

    -- Flashing Press Start
    if (math.floor(time() / 450) % 2) == 0 then
      draw_text_centered("A:NORMAL  B:FAST  X:DICTIONARY", 120, 110, 12, 1)
    else
      draw_text_centered("A:NORMAL  B:FAST  X:DICTIONARY", 120, 110, 14, 1)
    end

    draw_text_centered("ANTIGRAVITY © 2026", 120, 126, 14, 1)

  elseif current_state == STATE_SHRINE then
    local challenge = challenges[current_challenge_idx]
    draw_temple_columns()

    -- Central Marble Plaque Frame
    rectfill(32, 17, 208, 112, 15) -- fill plaque (Charcoal)
    rectb(30, 15, 180, 100, 14)   -- outer frame (Slate Blue)
    rectb(32, 17, 176, 96, 12)    -- inner border (White)

    -- Plaque Contents
    -- Golden 3x scaled Greek letter on the left
    draw_greek_letter(challenge.glyph, 64, 42, 4, 3)

    -- Greek Name and pronunciation
    local base_name, casing = string.match(challenge.name, "^([^%(]+)%s*%(([^%)]+)%)")
    if base_name and casing then
      print(base_name, 95, 26, 12, false, 2)
      print("Sound: /" .. challenge.sound .. "/  (" .. casing .. ")", 95, 45, 13, false, 1)
    else
      print(challenge.name, 95, 26, 12, false, 2)
      print("Sound: /" .. challenge.sound .. "/", 95, 45, 13, false, 1)
    end
    line(95, 54, 195, 54, 14)

    -- Mnemonic explanation lines
    print(challenge.mnemonic[1], 42, 68, 12)
    print(challenge.mnemonic[2], 42, 78, 12)
    print(challenge.mnemonic[3], 42, 88, 12)

    -- Prompt
    if (math.floor(time() / 400) % 2) == 0 then
      draw_text_centered("PRESS (A) TO ENTER BATTLE", 120, 122, 4)
    else
      draw_text_centered("PRESS (A) TO ENTER BATTLE", 120, 122, 12)
    end

  elseif current_state == STATE_BATTLE then
    local challenge = challenges[current_challenge_idx]

    -- HUD
    print("SCORE: " .. string.format("%05d", score), 10, 6, 13)
    print("CHALLENGE: " .. current_challenge_idx .. "/" .. #challenges, 90, 6, 13)

    -- Hearts layout
    for i = 1, 3 do
      draw_heart(190 + (i-1)*10, 6, i <= player_lives)
    end

    -- Draw Monster
    local t = time()
    local bob = math.sin(t / 150) * 1.8
    local monster_col = (battle_status == "incorrect") and 2 or 12
    draw_battle_monster(120, 32, t, monster_col)

    -- Glowing Shield on Monster's Chest (bobs with the monster)
    local shield_x = 120
    local shield_y = math.floor(52 + bob + 0.5)
    circfill(shield_x, shield_y, 8, 4) -- Gold shield (smaller to fit chest)
    circb(shield_x, shield_y, 8, 12)   -- White border
    -- Draw Greek Letter on Shield
    draw_greek_letter(challenge.glyph, shield_x, shield_y, 0, 2)

    -- Draw Diamond Menu Frame
    local cx, cy = 120, 98
    local r = 24
    line(cx, cy - r - 4, cx + r + 4, cy, 14)
    line(cx + r + 4, cy, cx, cy + r + 4, 14)
    line(cx, cy + r + 4, cx - r - 4, cy, 14)
    line(cx - r - 4, cy, cx, cy - r - 4, 14)
    circb(cx, cy, 5, 14)

    -- Highlight Wedge if Input Entered/Timer running
    if battle_selected_idx > 0 then
      local hcol = (battle_status == "correct") and 6 or 2
      -- Draw highlighting wedge dot/indicator next to selection
      local hx, hy = cx, cy
      if battle_selected_idx == 1 then hy = cy - r
      elseif battle_selected_idx == 2 then hx = cx - r
      elseif battle_selected_idx == 3 then hx = cx + r
      elseif battle_selected_idx == 4 then hy = cy + r end
      circfill(hx, hy, 4, hcol)
    end

    -- Option Text & Button Prompt Indicators
    -- Top option: Index 1
    local col1 = (battle_selected_idx == 1 and battle_status == "incorrect") and 2 or 12
    if battle_status ~= "idle" and challenge.correct == 1 then col1 = 6 end
    draw_text_centered(challenge.options[1], cx, cy - r - 8, col1)

    -- Left option: Index 2
    local col2 = (battle_selected_idx == 2 and battle_status == "incorrect") and 2 or 12
    if battle_status ~= "idle" and challenge.correct == 2 then col2 = 6 end
    print(challenge.options[2], cx - r - 6 - #challenge.options[2] * 6, cy - 3, col2)

    -- Right option: Index 3
    local col3 = (battle_selected_idx == 3 and battle_status == "incorrect") and 2 or 12
    if battle_status ~= "idle" and challenge.correct == 3 then col3 = 6 end
    print(challenge.options[3], cx + r + 6, cy - 3, col3)

    -- Bottom option: Index 4
    local col4 = (battle_selected_idx == 4 and battle_status == "incorrect") and 2 or 12
    if battle_status ~= "idle" and challenge.correct == 4 then col4 = 6 end
    draw_text_centered(challenge.options[4], cx, cy + r + 2, col4)

    -- Success/Failure status texts overlay
    if battle_status == "correct" then
      draw_text_centered("CORRECT! +100", cx, 30, 6, 1)
    elseif battle_status == "incorrect" then
      draw_text_centered("INCORRECT! -1 LIFE", cx, 30, 2, 1)
    end

    draw_particles()

  elseif current_state == STATE_TRIAGE_INT then
    draw_temple_columns()

    -- Plaque Frame
    rectfill(32, 17, 208, 112, 15)
    rectb(30, 15, 180, 100, 14)
    rectb(32, 17, 176, 96, 12)

    draw_text_centered("FALSE FRIEND TRIAGE", 120, 26, 4, 1)
    draw_text_centered("QUICK REFLEX CHALLENGE", 120, 36, 12, 1)
    line(45, 46, 195, 46, 14)

    print("Look-alike letters will flash.", 44, 54, 13)
    print("Identify if the pronunciation is", 44, 64, 12)
    print("GREEK or LATIN/ENGLISH.", 44, 74, 12)

    print("< D-PAD LEFT: GREEK", 44, 88, 11)
    print("  D-PAD RIGHT: LATIN >", 44, 98, 3)

    -- Prompt
    if (math.floor(time() / 450) % 2) == 0 then
      draw_text_centered("PRESS ANY BUTTON TO BEGIN", 120, 122, 12)
    end

  elseif current_state == STATE_TRIAGE then
    local active_triage = active_triage_list[triage_idx]

    -- HUD
    print("SCORE: " .. string.format("%05d", score), 10, 6, 13)
    print("TRIAGE: " .. triage_idx .. "/10", 160, 6, 13)

    -- Swirling Portal Circles
    local pulse1 = math.sin(time() / 80) * 3
    local pulse2 = math.cos(time() / 80) * 3
    circb(120, 58, 22 + pulse1, 8)
    circb(120, 58, 26 + pulse2, 14)
    circb(120, 58, 30, 9)

    -- Flashing glyph in center
    draw_triage_glyph(active_triage.char, 120, 58, 4, 3)

    -- Pronunciation Prompt below portal
    draw_text_centered("sounds like: " .. active_triage.sound, 120, 92, 12, 1)

    -- Input hints
    rectb(10, 48, 55, 18, 11)
    print("< GREEK", 15, 54, 11)

    rectb(175, 48, 55, 18, 3)
    print("LATIN >", 180, 54, 3)

    -- Timer Bar
    if triage_flash_time == 0 then
      rectb(58, 108, 124, 6, 14)
      rectfill(60, 110, 60 + 120 * (triage_timer / triage_max_timer), 112, 3)
    end

    -- Flash message overlay
    if triage_flash_time > 0 then
      rectfill(10, 106, 230, 126, 15)
      rectb(10, 106, 230, 126, triage_flash_col)
      draw_text_centered(triage_flash_msg, 120, 112, triage_flash_col, 1)
    end

    draw_particles()

  elseif current_state == STATE_GAMEOVER then
    draw_temple_columns()
    draw_text_centered("DEFEATED BY CHRONOS", 120, 32, 2, 2)
    draw_text_centered("Mnemosyne's memories fade...", 120, 55, 12, 1)

    draw_text_centered("Letters Unlocked: " .. (current_challenge_idx - 1) .. "/" .. #challenges, 120, 72, 13, 1)
    draw_text_centered("FINAL SCORE: " .. score, 120, 84, 4, 1)

    if (math.floor(time() / 450) % 2) == 0 then
      draw_text_centered("PRESS ANY BUTTON TO RETRY", 120, 108, 12, 1)
    end

  elseif current_state == STATE_VICTORY then
    draw_temple_columns()
    draw_text_centered("TRIUMPH OF MIND!", 120, 24, 6, 2)
    draw_text_centered("The Diamond of Mnemosyne is restored!", 120, 46, 11, 1)

    -- Rank calculation
    local max_score = #challenges * 100 + 1000
    local rank = "Novice Philosopher"
    local rcol = 13
    if score >= max_score - 200 then
      rank = "High Priest of Mnemosyne"
      rcol = 4
    elseif score >= max_score - 500 then
      rank = "Acolyte of the Shrine"
      rcol = 6
    end

    draw_text_centered("YOUR CLERICAL RANK:", 120, 62, 12, 1)
    draw_text_centered(rank, 120, 72, rcol, 1)
    draw_text_centered("FINAL SCORE: " .. score, 120, 88, 4, 1)
    draw_text_centered("Triage Score: " .. triage_score .. "/10 correct", 120, 98, 13, 1)

    if (math.floor(time() / 450) % 2) == 0 then
      draw_text_centered("PRESS ANY BUTTON TO PLAY AGAIN", 120, 114, 12, 1)
    end

  elseif current_state == STATE_DICTIONARY then
    local challenge = master_challenges[dict_idx]
    draw_temple_columns()

    -- Central Marble Plaque Frame
    rectfill(32, 17, 208, 112, 15) -- fill plaque (Charcoal)
    rectb(30, 15, 180, 100, 14)   -- outer frame (Slate Blue)
    rectb(32, 17, 176, 96, 12)    -- inner border (White)

    -- Plaque Contents
    draw_greek_letter(challenge.glyph, 64, 42, 4, 3)

    -- Greek Name and pronunciation
    local base_name, casing = string.match(challenge.name, "^([^%(]+)%s*%(([^%)]+)%)")
    if base_name and casing then
      print(base_name, 95, 26, 12, false, 2)
      print("Sound: /" .. challenge.sound .. "/  (" .. casing .. ")", 95, 45, 13, false, 1)
    else
      print(challenge.name, 95, 26, 12, false, 2)
      print("Sound: /" .. challenge.sound .. "/", 95, 45, 13, false, 1)
    end
    line(95, 54, 195, 54, 14)

    -- Mnemonic explanation lines
    print(challenge.mnemonic[1], 42, 68, 12)
    print(challenge.mnemonic[2], 42, 78, 12)
    print(challenge.mnemonic[3], 42, 88, 12)

    -- Page indicator
    draw_text_centered("PAGE " .. dict_idx .. "/" .. #master_challenges, 120, 101, 13)

    -- Navigation prompt
    draw_text_centered("< L/R: BROWSE    (B): EXIT >", 120, 122, 12)
  end

  -- Sliding Transition Wipe Layer
  if transition_active then
    if transition_timer >= 15 then
      -- Wipe out (closing)
      local h = 136 * (30 - transition_timer) / 15
      rectfill(0, 0, 240, h, 0)
    else
      -- Wipe in (opening)
      local h = 136 * transition_timer / 15
      rectfill(0, 136 - h, 240, 136, 0)
    end
  end
end

-- =====================================================================
-- TIC-80 MAIN GAME LOOP
-- =====================================================================

local initialized = false

function TIC()
  -- Reset screen offset (for screen shake cleanup)
  poke(0x3FF9, 0)
  poke(0x3FFA, 0)

  if not initialized then
    init_game()
    initialized = true
  end

  update_game()
  draw_game()

  -- Apply screen shake at the end of the frame
  if shake_intensity > 0 then
    local sx = math.random(-shake_intensity, shake_intensity)
    local sy = math.random(-shake_intensity, shake_intensity)
    poke(0x3FF9, sx)
    poke(0x3FFA, sy)
    shake_intensity = shake_intensity - 1
  end
end

-- =====================================================================
-- MEMORY ASSETS (embedded configuration)
-- =====================================================================

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

