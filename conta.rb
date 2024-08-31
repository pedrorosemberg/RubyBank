def print_logo()
  red_color_code = "\e[31m"
  reset_color_code = "\e[0m"

  logo_top = <<-'LOGO'
=======================================
  LOGO

  logo_red_part = <<-'LOGO'
                /\\
               /  \\
              / /\\ \\
             / /  \\ \\
            / /____\\ \\
            \\ \\    / /
             \\ \\  / /
              \\ \\/ /
               \\  /
                \\/
             RUBY BANK
  LOGO

  logo_bottom = <<-'LOGO'
=======================================
  LOGO

  puts "#{red_color_code}#{logo_red_part}#{reset_color_code}"
  puts "#{logo_bottom}"
end

print_logo()

def print_menu()
  puts "[1] Criar conta"
  puts "[2] Sacar"
  puts "[3] Depositar"
  puts "[4] Transferir"
  puts "[5] Listar contas"
  puts "[6] Acesso a conta"
  puts "[7] Sair"
end

def print_boas_vindas()
  puts "\e[34mSeja bem-vindo(a) ao Ruby Bank\e[0m"  # Azul para boas-vindas
end

print_boas_vindas()

# Classe Conta (sem herança)
class Conta
  attr_reader :cliente, :banco

  def initialize(cliente)
    @cliente = cliente
    @banco = Bancos.new  # Instancia um objeto Bancos
  end

  def sacar(valor)
    if @banco.tipo == "Corrente" || @banco.saldo >= valor
      @banco.saldo -= valor
      puts "Saque efetuado com sucesso"
    else
      puts "\e[31mSaldo insuficiente\e[0m"  # Vermelho para saldo insuficiente
    end
  end

  def consultar_saldo
    saldo = @banco.saldo
    if saldo > 0
      puts "\e[32mSeu saldo atual é: R$#{saldo}\e[0m"  # Verde para saldo positivo
    else
      puts "\e[31mSeu saldo atual é: R$#{saldo}\e[0m"  # Vermelho para saldo zerado ou negativo
    end
  end

  def depositar(valor)
    @banco.saldo += valor
    puts "Depósito efetuado com sucesso"
  end

  def transferir(conta_destino, valor)
    if @banco.tipo == "Corrente" || @banco.saldo >= valor
      sacar(valor)
      conta_destino.depositar(valor)
      puts "Transferência efetuada com sucesso"
    else
      puts "\e[31mSaldo insuficiente. Não foi possível transferir.\e[0m"  # Vermelho para saldo insuficiente
    end
  end

  def exibir_informacoes
    puts "\e[34mBanco: #{@banco.banco}\e[0m"
    puts "\e[34mAgência: #{@banco.agencia}\e[0m"
    puts "\e[34mNúmero da conta: #{@banco.conta}\e[0m"
    puts "\e[34mIBAN: #{@banco.iban}\e[0m"
    puts "\e[34mTipo: #{@banco.tipo}\e[0m"
    puts "\e[34mSaldo: #{@banco.saldo}\e[0m"
  end
end

# Lista global de contas
$contas = []

# Função para encontrar contas pelo CPF
def encontrar_contas(cpf)
  $contas.select { |conta| conta.cliente.cpf == cpf }
end

# Função para criar uma nova conta
def criar_conta
  print "Digite o nome do titular: "
  nome = gets.chomp
  print "Digite o sobrenome do titular: "
  sobrenome = gets.chomp
  print "Digite o CPF do titular: "
  cpf = gets.chomp
  print "Digite o RG do titular: "
  rg = gets.chomp
  print "Digite o email do titular: "
  email = gets.chomp
  print "Digite o telefone do titular: "
  telefone = gets.chomp

  cliente = Cliente.new(nome, sobrenome, cpf, rg, email, telefone)
  conta = Conta.new(cliente)
  $contas << conta

  puts "Conta criada com sucesso!"
  conta.exibir_informacoes
end

# Função para sacar dinheiro
def sacar
  print "Digite o CPF da conta: "
  cpf = gets.chomp
  contas = encontrar_contas(cpf)

  if contas.any?
    puts "Selecione a conta:"
    contas.each_with_index do |conta, index|
      puts "[#{index + 1}] Conta #{index + 1}"
    end
    escolha = gets.chomp.to_i - 1
    conta = contas[escolha]

    print "Digite o valor a sacar: "
    valor = gets.chomp.to_f
    conta.sacar(valor)
  else
    puts "\e[31mConta não encontrada!\e[0m"
  end
end

# Função para depositar dinheiro
def depositar
  print "Digite o CPF da conta: "
  cpf = gets.chomp
  contas = encontrar_contas(cpf)

  if contas.any?
    puts "Selecione a conta:"
    contas.each_with_index do |conta, index|
      puts "[#{index + 1}] Conta #{index + 1}"
    end
    escolha = gets.chomp.to_i - 1
    conta = contas[escolha]

    print "Digite o valor a depositar: "
    valor = gets.chomp.to_f
    conta.depositar(valor)
  else
    puts "\e[31mConta não encontrada!\e[0m"
  end
end

# Função para transferir dinheiro
def transferir
  print "Digite o CPF da conta de origem: "
  cpf_origem = gets.chomp
  contas_origem = encontrar_contas(cpf_origem)

  if contas_origem.any?
    puts "Selecione a conta de origem:"
    contas_origem.each_with_index do |conta, index|
      puts "[#{index + 1}] Conta #{index + 1}"
    end
    escolha_origem = gets.chomp.to_i - 1
    conta_origem = contas_origem[escolha_origem]

    print "Digite o CPF da conta de destino: "
    cpf_destino = gets.chomp
    contas_destino = encontrar_contas(cpf_destino)

    if contas_destino.any?
      puts "Selecione a conta de destino:"
      contas_destino.each_with_index do |conta, index|
        puts "[#{index + 1}] Conta #{index + 1}"
      end
      escolha_destino = gets.chomp.to_i - 1
      conta_destino = contas_destino[escolha_destino]

      print "Digite o valor a transferir: "
      valor = gets.chomp.to_f
      conta_origem.transferir(conta_destino, valor)
    else
      puts "\e[31mConta de destino não encontrada!\e[0m"
    end
  else
    puts "\e[31mConta de origem não encontrada!\e[0m"
  end
end

# Função para listar todas as contas
def listar_contas
  if $contas.empty?
    puts "\e[33mNenhuma conta cadastrada.\e[0m"  # Amarelo para nenhuma conta
  else
    $contas.each do |conta|
      puts "\e[36mTitular: #{conta.cliente.nome} #{conta.cliente.sobrenome} | CPF: #{conta.cliente.cpf} | Banco: #{conta.banco.banco} | Agência: #{conta.banco.agencia} | Conta: #{conta.banco.conta} | Saldo: #{conta.banco.saldo}\e[0m"
    end
  end
end

# Função para acessar uma conta
def acessar_conta
  print "Digite o CPF da conta: "
  cpf = gets.chomp
  contas = encontrar_contas(cpf)

  if contas.any?
    puts "Selecione a conta:"
    contas.each_with_index do |conta, index|
      puts "[#{index + 1}] Conta #{index + 1}"
    end
    escolha = gets.chomp.to_i - 1
    conta = contas[escolha]

    puts "\e[34mInformações da Conta\e[0m"
    conta.exibir_informacoes
    puts "\e[34mInformações do Titular\e[0m"
    print_informacoes_pessoais(conta.cliente)
  else
    puts "\e[31mConta não encontrada!\e[0m"
  end
end

def print_informacoes_pessoais(cliente)
  puts "\e[31mNome: #{cliente.nome} #{cliente.sobrenome}\e[0m"
  puts "\e[31mCPF: #{cliente.cpf}\e[0m"
  puts "\e[31mRG: #{cliente.rg}\e[0m"
end

# Loop do Menu
loop do
  print_menu
  print "Escolha uma opção: "
  opcao = gets.chomp.to_i

  case opcao
  when 1
    criar_conta
  when 2
    sacar
  when 3
    depositar
  when 4
    transferir
  when 5
    listar_contas
  when 6
    acessar_conta
  when 7
    puts "Saindo do sistema...\n"
    print_colored_messages()
    break
  else
    puts "\e[31mOpção inválida! Tente novamente.\e[0m"  # Vermelho para opção inválida
  end

  puts "\n"  # Adiciona uma linha em branco para melhorar a legibilidade do menu
end

def print_colored_messages
  # Códigos de cores ANSI
  red_color_code = "\e[31m"
  green_color_code = "\e[32m"
  blue_color_code = "\e[34m"
  reset_color_code = "\e[0m"

  # Mensagens com cores
  puts "#{red_color_code}Obrigado por usar o Ruby Bank!#{reset_color_code}"
  puts "#{red_color_code}© 2024 RUBYBANK & Co. All Rights Reserved.#{reset_color_code}"

  puts "#{green_color_code}© 2024 Developed by CODEVER LLC#{reset_color_code}"
end
