inputf = ARGV[0] # blast6 standard format
blastdb = ARGV[1] # blastdb

File.open(inputf).each do |line|
  ary = line.chomp.split(/\t/)
  sid = ary[1]
  cmd = %Q{blastdbcmd -entry "#{sid}" -db #{blastdb} -outfmt "%t" }
#  puts cmd
  res = nil
  IO.popen(cmd){|io| res = io.read}
  defi = res.chomp.strip
  puts [ary, defi].flatten.join("\t")
end
