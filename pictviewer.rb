#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-
=begin
= PictViewer.rb
作成者 : Fei
Author : Fei
=end

require  'gtk2'
require  'rubygems'
require  'RMagick'

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
  # 比率の自動計算(height基準)
  RATES = WINDOW_SIZE[1].to_f / height
  print RATES
  image.pixbuf = image.pixbuf.scale(width*RATES, height*RATES)
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
