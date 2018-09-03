#!/usr/bin/perl
$blast_file = $ARGV[0];				# BLAST結果ファイル
$tit_file = $ARGV[1];				# タイトル行を集めたファイル
$coln = ($ARGV[2] ? $ARGV[2] : 1);		# BLAST結果でjoinの対象とするカラム(1から数える)。デフォルトは1

# まず、$tit_file を使ってハッシュ表を作成する
open(F1, $tit_file);		# $tit_file を読み込み用に開く
while($l = <F1>) {
	chomp $l;						  # 最後の改行を取り除く
	($name, $title) = split(/\t/,$l);    # タブで区切って、各カラムを$name, $titleという変数に格納
	$Title{$name} = $title;		       # 名前からタイトルを引くためのハッシュ%Titleを作成
}
close(F1);			#複数のファイルを扱うときは、一つのファイル処理が終わるごとに明示的にクローズした方がよい

# ハッシュを使って、$blast_file にタイトルを付け加える
open(F2, $blast_file);	# $blast_file をファイルを読み込み用に開く
while($l = <F2>) {
	chomp $l;				# 最後の改行を取り除く
	@col = split(/\t/,$l);	# タブで区切って、各カラムを配列 @col に格納
	$name = $col[$coln-1];		# $coln番目のカラム（デフォルトは2番目＝サブジェクトのID）を $name として取り出す
	$title = $Title{$name};		# 先に作ったハッシュを使って、タイトルを取り出す
	print join("\t", @col, $title),"\n";	# 各カラムの値(@col)の後ろに$titleを加えて、タブ区切りで出力
}
