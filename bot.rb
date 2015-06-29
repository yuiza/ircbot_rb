require 'cinch'

bot = Cinch::Bot.new do
	configure do |c|
        c.server = 'localhost'
	    c.port = 6667.to_i
        c.password = ''
	    c.channels = ['#sousei']
	    c.nick = 'yuiza_bot'
	    c.realname = 'yuiza_bot'
	    c.user = 'yuiza_bot'
     end


on :message, "hello" do |m|
	m.reply "hello, #{m.user.nick}"
end

end

bot.start
