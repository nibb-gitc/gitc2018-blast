inputf = ARGV[0]

File.open(inputf).each do |l|
  a = l.chomp.split(/\t/)
  query = a[0]
  target = a[1]
  from = a[8].to_i
  to = a[9].to_i
  score = a[11].to_f

  left, right = [from, to].sort
  left = left - 1 # 0-based coordinate
  strand = ( from < to ? "+" : "-")

  [query, target, left, right, strand]

  puts [target, left, right, query, score, strand].join("\t")
end
