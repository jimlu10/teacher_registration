module JsonHelper
  def json_body
    @json_body ||= JSON.parse(response.body).deep_symbolize_keys
  end
end
