intent "Joke" do

    post = Page.get_post("/r/jokes")

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