class Cliente
  attr_accessor :nome, :sobrenome, :email, :telefone
  attr_reader :cpf, :rg

  def initialize(nome, sobrenome, cpf, rg, email, telefone)
    @nome = nome
    @sobrenome = sobrenome
    @cpf = cpf
    @rg = rg
    @email = email
    @telefone = telefone
  end
end