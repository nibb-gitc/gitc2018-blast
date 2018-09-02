PALLET = "YlGnBu"

inputf = ARGV[0]

def score_to_color(score)
#  p score
  if score >= 200.0
    klass = 5
  elsif score > 80
    klass = 4
  elsif score > 50
    klass = 3
  elsif score > 40
    klass = 2
  else
    klass = 1
  end
  return klass
end

puts "library(RColorBrewer)"
puts %Q{pallet = brewer.pal(5, "#{PALLET}")}

data = []
File.open(inputf).each_with_index do |l, i|
  a = l.chomp.split(/\t/)
  data << a
end

 qmax = data.map{|d| [d[6].to_i, d[7].to_i]}.flatten.sort[-1]
 tmax = data.map{|d| [d[8].to_i, d[9].to_i]}.flatten.sort[-1]
 qname = data[0][0]
 tname = data[0][1]


cmd = %Q{plot(matrix(c(0,0, #{qmax}, #{tmax}), 2, byrow=T), xlab="#{qname}", ylab="#{tname}", type="n")}
puts cmd

data.each do |a|
  qstart = a[6].to_i
  qend = a[7].to_i
  tstart = a[8].to_i
  tend = a[9].to_i
  bitscore = a[11].to_f

  cmd = %Q{segments(#{qstart}, #{tstart}, #{qend}, #{tend}, lwd=3, col=pallet[#{score_to_color(bitscore)}] ) }
  puts cmd
end

cmd = %Q{legend("bottomright", title="bitscore", c(">200", ">80", ">50", ">40", "<40"), fill=rev(c(pallet)))}
puts cmd
