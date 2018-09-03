#!/usr/bin/ruby

infile = ARGV[0]
eval_cutoff = 0.001

f = File.open(infile)

while line = f.gets

    line.chomp!
    col = line.split("\t")
    if col[10].to_f() <= eval_cutoff
        puts [col[0], col[1], col[10]].join("\t")
    end
end

