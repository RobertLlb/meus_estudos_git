class DeepseekService
  include HTTParty
  base_uri 'https://api.deepseek.com/v1' # Substitua pela URL correta da API

  def self.generate_git_command(description)
    response = post('/generate', {
      body: {
        prompt: "Generate a Git command for: #{description}",
        max_tokens: 50
      }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{ENV['DEEPSEEK_API_KEY']}"
      }
    })

    if response.success?
      response.parsed_response['choices'][0]['text'].strip
    else
      raise "Erro na API: #{response.code} - #{response.message}"
    end
  rescue StandardError => e
    raise "Erro ao chamar a API do DeepSeek: #{e.message}"
  end
end