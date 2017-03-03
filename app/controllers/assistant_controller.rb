class AssistantController < ApplicationController
  def messenger
    query = (params[:result][:parameters]['any'].present?)? params[:result][:parameters]['any'] : "Ruby On Rails"
    page = WikipediaConsulter.find_by_name(query)

    if page.text.present?
      text = "#{page.text.slice(0, 150)}... \b link completo: #{page.fullurl}"
    else
      text = "No encontrei essa pgina na Wikipedia em ingls :("
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