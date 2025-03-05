class GitCommandsController < ApplicationController
  def index
    # Renderiza o formulário
  end

  def create
    description = params[:description]

    begin
      @git_command = DeepseekService.generate_git_command(description)
      flash[:success] = "Comando gerado com sucesso!"
    rescue StandardError => e
      flash[:error] = "Erro: #{e.message}"
    end

    # Redireciona para a página inicial
    redirect_to root_path
  end
end