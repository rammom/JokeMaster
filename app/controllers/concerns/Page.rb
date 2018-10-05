module Page

    def self.get_post(sub)

        # set custom user agent to avoid reddit blocking requests
        uri = "https://old.reddit.com"+sub
        page = Nokogiri::HTML(open("https://old.reddit.com"+sub, 'User-Agent' => 'Moose'))

        # get links to all jokes on /r/jokes home page
        entries = (page.css("div.thing") - page.css("div.stickied") - page.css("div.promoted")).css("div.entry")

        link = entries[rand(0..entries.length-1)].css("div.top-matter")[0].css("p.title")[0].css("a.title")[0]["href"]

        page = Nokogiri::HTML(open("https://old.reddit.com"+link, 'User-Agent' => 'Moose'))
        
        entry = page.css("div.thing")[0].css("div.entry")[0]

        title = entry.css("div.top-matter")[0].css("p.title")[0].css("a.title")[0].text

        body = ""
        p_elems = entry.css("div.expando")[0].css("form")[0].css("div.usertext-body")[0].css("div.md")[0].css("p")
        p_elems.each do |elem|
            body += "#{elem.text} "
        end

        post = {
            :title => title,
            :body => body
        }

        return post
    end

end