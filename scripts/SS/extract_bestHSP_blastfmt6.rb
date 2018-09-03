query_prev = nil

ARGF.each do |l|
  a = l.chomp.split(/\t/)
  query = a[0]
  puts l unless query_prev == query
  query_prev = query
end
