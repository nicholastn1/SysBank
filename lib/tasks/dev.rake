namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configurações iniciais do banco."
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Criando Ambiente...") {%x(rails db:drop db:create db:migrate)}
      show_spinner("Criando Usuário Padrão...") {%x(rails dev:add_default_user)}
    else
      puts "Are you not in development enviroment!"
    end
  end

  desc "Adicionar usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
