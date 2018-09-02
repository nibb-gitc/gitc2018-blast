inputf = ARGV[0]

File.open(inputf).each_with_index do |l, i|
  a = l.chomp.split(/\t/)
  qname = a[0]
  tname = a[1]
  qstart = a[6].to_i
  qend = a[7].to_i
  tstart = a[8].to_i
  tend = a[9].to_i

  if i == 0
    puts [qname, tname].join("\t")
  end
  puts [qstart, tstart].join("\t")
  puts [qend, tend].join("\t")
  puts ["NA", "NA"].join("\t")


end

###
# example of R code
#> d <- read.delim("out.rdot")
#> plot(d, type="l", lwd=2)
