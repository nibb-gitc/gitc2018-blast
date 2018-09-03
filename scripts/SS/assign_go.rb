input = ARGV[0]
nth_geneid = 12

go_source = "gene_association.fb"

## load go <=> gene association
gene2go = Hash.new
File.open(go_source).each do |l|
  next if /^\!/.match(l)
  a = l.chomp.split(/\t/)
  go = a[4]
  gene = a[1]

  unless gene2go.has_key?(gene)
    gene2go[gene] = []
  end

  gene2go[gene] << go
end

## process input file and assign go terms
File.open(input).each do |l|
  a = l.chomp.split(/\t/, -1)
  fbgn = a[nth_geneid]
  gos = gene2go.fetch(fbgn,[]).sort.uniq
  puts [a, gos.join(";")].flatten.join("\t")
end
