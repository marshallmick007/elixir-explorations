# Seed Erlangs Random Number Gen
:random.seed(:erlang.timestamp)

# additional good files here: https://github.com/morganecf/synonym-game/tree/master/data/word_files

adv_file = "adverbs-1.txt"
adj_file = "adjectives-4.txt"
noun_file = "nouns-4.txt"
split_char = " "

read_file = fn(file) ->
  {:ok, contents} = File.read(file)
  String.split(contents, ["\r", "\n"], trim: true)
end

adverbs = read_file.(adv_file)
adjectives = read_file.(adj_file)
nouns = read_file.(noun_file)

IO.puts "Found #{length(adverbs)} Adverbs, #{length(adjectives)} Adjectives, #{length(nouns)} Nouns"

Enum.each(1..4, fn(_) ->
  #adv1 = Enum.random(adverbs)
  adj1 = Enum.random(adjectives)
  adj2 = Enum.random(adjectives)
  noun = Enum.random(nouns)

  IO.puts "# #{adj1}#{split_char}#{adj2}#{split_char}#{noun}"
end)

