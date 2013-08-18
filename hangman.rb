#!/usr/bin/env ruby
# Assignment 190 - Hangman submitted by Beth Tenorio

word_bank = ["abduct",  "abjure",  "abused",  "acquit",  "adjoin",  "adjure",  "adjust",  "advent",  "adverb",  "advert",  "advice",  "aguish",  "almond",  "almost",  "ambush",  "amused",  "anemic",  "anodic",  "anyhow",  "ardent",  "argent",  "argued",  "around",  "arouse",  "arpent",  "artful",  "ashore",  "aspect",  "aspire",  "auntie",  "author",  "autism",  "avouch",  "avowed",  "aweigh",  "awhile",  "backed",  "balked",  "banged",  "banger",  "bangle",  "banker",  "banter",  "batmen",  "bawdry",  "beachy",  "beacon",  "becalm",  "bezoar",  "blared",  "bleary",  "blight",  "blonde",  "blotch",  "blouse",  "bodice",  "bodily",  "bought",  "bounce",  "bourse",  "boused",  "bowfin",  "bowing",  "bowled",  "bowler",  "bowman",  "boxcar",  "boxful",  "boxier",  "branch",  "bugler",  "bulged",  "bumped",  "bumper",  "bungle",  "burned",  "bursae",  "bursal",  "busied",  "busier",  "busily",  "byline",  "bypath",  "cagier",  "candor",  "canful",  "canted",  "canter",  "cantle",  "capsid",  "captor",  "carton",  "carved",  "casein",  "casern",  "cashed",  "casque",  "cervix",  "cesium",  "chafed",  "chafer",  "chapel",  "chaste",  "chawed",  "comfit",  "coming",  "comity",  "compel",  "comply",  "confab",  "consul",  "copied",  "copier",  "costal",  "costed",  "costly",  "cougar",  "course",  "cousin",  "cowage",  "coward",  "cowpea",  "creamy",  "cresol",  "crikey",  "cringe",  "crispy",  "crowed",  "cruise",  "crumby",  "crusty",  "curvet",  "custom",  "cutely",  "cutler",  "danker",  "daphne",  "darkey",  "darkly",  "dasher",  "dauber",  "deploy",  "deputy",  "derail",  "desalt",  "donate",  "donkey",  "dorsal",  "double",  "doubly",  "dourly",  "downer",  "drench",  "drivel",  "driven",  "drowse",  "dumber",  "dumbly",  "etymon",  "fabric",  "facing",  "factor",  "failed",  "fakery",  "faking",  "falter",  "family",  "famine",  "faring",  "figure",  "filmed",  "finder",  "finely",  "finery",  "finest",  "finked",  "firmly",  "forced",  "fringe",  "fringy",  "frisky",  "glazer",  "glioma",  "glitch",  "glitzy",  "glower",  "glutei",  "hanker",  "hankie",  "haptic",  "harden",  "harked",  "harken",  "hating",  "hatpin",  "hatred",  "having",  "humane",  "hunted",  "hunter",  "husker",  "hybrid",  "induce",  "infamy",  "infect",  "inform",  "infuse",  "injury",  "inroad",  "inrush",  "jockey",  "joined",  "joiner",  "jounce",  "joyful",  "joying",  "juiced",  "juicer",  "jumped",  "karmic",  "kayoed",  "keying",  "keypad",  "kindle",  "kirsch",  "kitsch",  "kludge",  "knight",  "koruna",  "labium",  "lawmen",  "lawyer",  "laxest",  "laxity",  "lazier",  "legato",  "lemony",  "levity",  "lichen",  "ligate",  "lodger",  "lofted",  "loiter",  "longed",  "lucern",  "lumped",  "lusted",  "luster",  "lyrate",  "lysine",  "macule",  "magnet",  "magpie",  "mantle",  "manure",  "marble",  "marcel",  "marten",  "mashed",  "masher",  "mashie",  "medial",  "median",  "medick",  "medlar",  "medusa",  "mensal",  "mislay",  "misled",  "misted",  "mister",  "mobile",  "mocked",  "morgen",  "morgue",  "morsel",  "mortal",  "mosque",  "mostly",  "moving",  "mucked",  "myopic",  "myself",  "mystic",  "mythic",  "nailer",  "namely",  "native",  "nickel",  "nimble",  "nudity",  "nursed",  "octave",  "oilman",  "oilmen",  "oldish",  "olefin",  "ornate",  "oscine",  "osprey",  "osteal",  "ousted",  "ouster",  "outage",  "outbid",  "outlay",  "outvie",  "ovular",  "owlish",  "oxtail",  "oxygen",  "pacing",  "packed",  "pantry",  "parcel",  "pardon",  "parent",  "parget",  "paring",  "parish",  "parity",  "parley",  "patrol",  "patron",  "paused",  "pawing",  "pawned",  "penult",  "penury",  "permit",  "phloem",  "phobia",  "poetry",  "pokier",  "police",  "potful",  "potman",  "pounce",  "prated",  "precut",  "prefab",  "premix",  "presto",  "priced",  "pricey",  "punchy",  "purdah",  "purify",  "purine",  "quaked",  "quarto",  "quench",  "quiver",  "railed",  "rained",  "raking",  "rakish",  "ramjet",  "rancid",  "random",  "rasped",  "ratify",  "rating",  "ration",  "ravine",  "raving",  "ravish",  "rawest",  "rehung",  "relaid",  "repand",  "repast",  "replay",  "retold",  "revamp",  "risque",  "ritual",  "rotund",  "rouble",  "roused",  "routed",  "rowing",  "rucked",  "ruckle",  "ruling",  "rumple",  "rundle",  "safety",  "sagely",  "sailed",  "sailor",  "salmon",  "salted",  "satiny",  "satire",  "satori",  "scanty",  "scathe",  "scored",  "scoria",  "screwy",  "sexton",  "sexual",  "shaken",  "shaker",  "shamed",  "shaped",  "shaved",  "shaven",  "sherif",  "shovel",  "showed",  "simple",  "simply",  "sinewy",  "singly",  "sinker",  "sinter",  "sitcom",  "skated",  "skater",  "sleuth",  "slider",  "slight",  "smiled",  "smiler",  "smirch",  "smithy",  "smoked",  "smoker",  "smudgy",  "smugly",  "sodium",  "softly",  "soigne",  "soiled",  "solemn",  "solute",  "spared",  "spathe",  "sphinx",  "spiced",  "spigot",  "sporty",  "sprawl",  "spread",  "sprout",  "squeal",  "stable",  "staked",  "stamen",  "starve",  "staved",  "stupor",  "sturdy",  "stymie",  "styrax",  "sublet",  "submit",  "sultry",  "sundae",  "sunder",  "sunlit",  "surely",  "tamped",  "taping",  "tawdry",  "tholed",  "throne",  "throng",  "traced",  "tragic",  "trashy",  "travel",  "trench",  "trendy",  "trilby",  "triode",  "unshod",  "unsold",  "untidy",  "untied",  "unveil",  "unwary",  "unwrap",  "unyoke",  "vamped",  "varied",  "vaster",  "vastly",  "vector",  "vendor",  "votary",  "voting",  "vulgar",  "waling",  "walked",  "walker",  "walnut",  "washed",  "washer",  "wasted",  "whaler",  "whimsy",  "whined",  "winery",  "winker",  "winkle",  "winter",  "wisdom",  "wisped",  "woeful",  "zincky",  "zinged",  "zodiac",  "zombie",  "zygote"]

word = ['_', '_', '_', '_', '_', '_' ]
chances = 8

puts "Welcome to Hangman!"
answer = "______"
target = word_bank.sample
# puts target
guesses = []

def prompt(answer, chances)
  puts "Word: #{answer}"
  puts "Chances remaining: #{chances}"
  print "Guess a single letter (a-z) or the entire word: "
  @letter = gets.chomp
end

prompt(answer, chances)

while chances >= 1
  # print "Word: "
  # print word.to_s

  prompt(answer, chances)

  if guesses.include?(letter)
    puts "You already guessed that letter, try again."
    prompt(answer, chances)
  else
    guesses = guesses.push(letter)
  end

  # puts guesses
  # break


  if letter.length > 1
    guess_word = letter

    if guess_word == target
      puts "Congratulations, you've guessed the word!"
      break
    else
      puts "Sorry, you guessed wrong."
      chances -= 1  # Decrease the number of chances if the guess was wrong
      prompt(answer, chances)
      guesses = guesses.push(letter)
    end
  end

  count = 0
  count = target.count letter
  # puts "Number of occurences is: #{count}"
  starting_index = 0

  if count == 0
    puts "Sorry, no #{letter}'s found."
    # puts "Your guess so far: #{answer}"
    chances -= 1  # Decrease the number of chances if the guess was wrong
    prompt(answer, chances)
    puts
  else
    (1..count).each do |times|
      # puts "Loop number #{times}"
      # puts "At the start of the loop, starting index is: #{starting_index}"
      if target.index(letter, starting_index)
        ind = target.index(letter, starting_index)
        # puts "Found index of #{letter}: #{ind}"
        word[ind] = letter
        starting_index = ind + 1
        # puts "At the end of the loop, starting index is: #{starting_index}"
        answer = word.join()
      end
    end

    if answer == target
      puts "Congratulations, you've guessed the word!"
      break
    end
    puts "Found #{count} occurence(s) of the #{letter} character."
    # puts "Your guess so far: #{answer}"
    prompt(answer, chances)
    puts
  end

  if chances == 0
    puts "You're out of chances, better luck next time..."
    puts "Sorry, the hidden word was '#{target}'."
  end

end


puts "Thanks for playing!"