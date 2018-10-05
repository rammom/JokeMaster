require './app/controllers/concerns/Page.rb'

intent "CreepyStory" do

    post = Page.get_post("/r/creepypasta")

    return {
        "version": "1.0",
        "response": {
            "outputSpeech": {
                "type": "PlainText",
                "text": [post[:title], " . ", post[:body]].join
            },
            "shouldEndSession": true
        }
    }

end