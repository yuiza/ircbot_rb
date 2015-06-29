# -*- coding: utf-8 -*-
require 'cinch'
require 'sqlite3'

#Process.daemon

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.tb.cs.teu.ac.jp"
    c.channels = ["#test"]
    c.password = '1nsta11'
    c.nick = 'test_bot'
    c.port = 6667
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end
 
  on :message, "日本語" do |m|
    m.reply "日本語"
  end
  
  on :message, /h/ do |m|
    m.reply "正規表現"
  end

  on :message,/てす/ do |m| 
    m.reply "#{m.message}"
  end

end


bot.start
#member
#1nsta11
