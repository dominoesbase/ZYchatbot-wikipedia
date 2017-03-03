# Basic controller to respond
class AssistantController < ApplicationController
  def messenger
    query = (params[:result][:parameters]['any'].present?)? params[:result][:parameters]['any'] : "Ruby On Rails"
    page = WikipediaConsulter.find_by_name(query)

    if page.text.present?
      text = "#{page.text.slice(0, 300)}"
    else
      text = "I'm sorry, but I could not find this information."
    end

    response =
    {
      "speech": text,
      "displayText": text,
      "data": "",
      "source": "Programming Assitant"
    }

    render json: response
  end
end
