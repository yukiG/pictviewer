#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
=begin
= PictViewer.rb
Author : Kouji Kuramoto

このプログラムは、Kadai.rbのハッカソン01で作成したものである。
コマンドライン上で画像ファイルの引数を与えて実行することで、
簡易ビューアとして動作する。

=end


require  'gtk2'

# ファイル名の取得
filename = ARGV[0]

# 画面サイズの決定
WINDOW_SIZE = [640, 480]

# ウィンドウ生成
window = Gtk::Window.new

# 画像オブジェクトの生成
image = Gtk::Image.new(filename)

# 画像サイズの格納
width, height = image.pixbuf.width, image.pixbuf.height

# リサイズ
if width > WINDOW_SIZE[0] || height > WINDOW_SIZE[1]
  image.pixbuf = image.pixbuf.scale(*WINDOW_SIZE)
end

# ウィンドウ消去
window.signal_connect("destroy") do
  # ウィンドウ消去のイベントを検知したらプログラム終了
  Gtk.main_quit
end

# 描画
window.add(image)
window.show_all
Gtk.main
