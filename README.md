## ZYchatbot 
![Image](https://img.shields.io/badge/Ruby-2.5.1-green.svg)
![Image](https://img.shields.io/badge/Rails-5.0.1-green.svg)

### Description

The chatbot [ZY](https://dominoesbase.github.io/ZYchatbot-wikipedia/) was developed to be an assistant in Facebook Messenger.

This repository contains a small part of ZY (Search on Wikipedia). For that, a Gem was used to make it easier to consult on Wikipedia.

### Changing Wikipedia search settings

You can change some settings associated with the search on Wikipedia. To do this, you must access the controler **assistant_controler.rb**.

```ruby
# Basic controller to respond
class AssistantController < ApplicationController
  def messenger
    query = (params[:result][:parameters]['any'].present?)? params[:result][:parameters]['any'] : "Ruby On Rails"
    page = WikipediaConsulter.find_by_name(query)

    if page.text.present?
      text = "#{page.text.slice(0, 500)}" # Response size
    else
      text = "I'm sorry, but I could not find this information." # Response error
    end

    response =
    {
      "speech": text,
      "displayText": text,
      "data": "",
      "source": "Programming Assistant"
    }

    render json: response
  end
end
```
Or change the route (**routes.rb**).
```ruby
  post '/messenger' => 'assistant#messenger'
```

### Heroku and Dialogflow
Use a host to put the app online (for example:
**[Heroku](https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up)**).
To easily create the Bot, you can use the **[Dialogflow](https://dialogflow.com/)** platform.

### Last Revision
All vulnerabilities (Gemfile.lock) were fixed (2019/01/28).

### Author
* [dominoesbase](https://twitter.com/jorgedominoes)


