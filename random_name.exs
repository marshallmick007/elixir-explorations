# Seed Erlangs Random Number Gen
:random.seed(:erlang.timestamp)

adj_file = "adjectives-4.txt"
noun_file = "nouns-4.txt"
split_char = " "

read_file = fn(file) ->
  {:ok, contents} = File.read(file)
  String.split(contents, ["\r", "\n"], trim: true)
end

adjectives = read_file.(adj_file)
nouns = read_file.(noun_file)

IO.puts "Found #{length(adjectives)} Adjectives, #{length(nouns)} Nouns"

adj1 = Enum.random(adjectives)
adj2 = Enum.random(adjectives)
noun = Enum.random(nouns)

IO.puts "#{adj1}#{split_char}#{adj2}#{split_char}#{noun}"

