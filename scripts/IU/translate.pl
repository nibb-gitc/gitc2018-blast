#!/usr/bin/perl

use Bio::SeqIO;    # Bio::SeqIO モジュールの利用

$infile = $ARGV[0];	# 入力配列ファイル(FASTA形式）を引数で指定
$outfile = ">&STDOUT";	# 出力もFASTA形式で標準出力(&STDOUT)へ

# FASTA形式の配列ファイル($infile)を読み込み用に開く（入力ファイルオブジェクト$seqinの作成）
$seqin = Bio::SeqIO->new(-file=>$infile, -format=>'fasta');

# FASTA形式の書き込み用の配列ファイル($outfile)を開く（出力ファイルオブジェクト$seqoutの作成）
$seqout = Bio::SeqIO->new(-file=>">$outfile", -format=>'fasta');

# 入力ファイルから配列を一つずつとってくる　（メソッドnext_seq; 配列オブジェクト$seq_objが返る）
while ($seq_obj = $seqin->next_seq) {
	$protseq = $seq_obj->translate; 	# 配列を翻訳する（メソッドtranslate）
	$seqout->write_seq($protseq);		# 出力ファイル（FASTA形式）に書き込む（メソッドwrite_seq）
}
