# Seed Erlangs Random Number Gen
#:rand.seed(:exsplus, {0, 0, 7})
:random.seed(:erlang.timestamp)

adj_file = "adjectives-4.txt"
noun_file = "nouns-4.txt"
{:ok, contents} = File.read(adj_file)
adjectives = String.split(contents, ["\r", "\n"], trim: true)
{:ok, contents} = File.read(noun_file)
nouns = String.split(contents, ["\r", "\n"], trim: true)
#IO.puts contents
#File.stream!(file) |> Enum.each( fn line ->
  #list ++ line
  #  IO.puts line
  #end)

IO.puts "Found #{length(adjectives)} Adjectives, #{length(nouns)} Nouns"

adjective = Enum.random(adjectives)
noun = Enum.random(nouns)
adj2 = Enum.random(adjectives)

IO.puts "#{adjective} #{adj2} #{noun}"

