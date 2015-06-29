# -*- coding: utf-8 -*-
require 'rubygems'
require 'sqlite3'

##データベース読み込み
  db = SQLite3::Database.new("database.db")
  ##ファイルが無い場合、テーブルの作成
  sql = <<SQL
create table Person (
  name varchar(10),
  age  integer,
  post varchar(200)
);
SQL
  db.execute(sql)
  puts "New file is created."

  #トランザクションによる値の挿入
  db.transaction do
    sql = "insert into Person values (?, ?, ?)"
    db.execute(sql, '橋本', 26, '広報部')
    db.execute(sql, '小泉', 35, '営業部')
    db.execute(sql, '亀井', 40, '営業部')
  end

  #レコードを取得する
  db.execute('select * from Person') do |row|
    #rowは結果の配列
    puts row.join("\t")
  end
  db.close
