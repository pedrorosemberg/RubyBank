class Bancos
  attr_reader :banco, :conta, :iban
  attr_accessor :saldo, :tipo, :agencia

  def initialize
    set_banco
    set_agencia
    set_conta
    set_iban
    set_tipo
    @saldo = 0
  end

  def set_banco
    @random_number_banco = rand(0..10)
    @banco = case @random_number_banco
             when 0 then "Ruby International Bank & Co. - USA"
             when 1 then "Ruby Finance Bank Ltd. - Europe"
             else "Banco Ruby S.A. - Brasil"
             end
  end

  def set_agencia
    @agencia = rand(1000..9999)
  end

  def set_conta
    @conta = 10.times.map { rand(0..9) }.join.to_i
  end

  def set_iban
    @iban = 20.times.map { rand(0..9) }.join.to_i
  end

  def set_tipo
    case @random_number_banco
    when 0
      @tipo = "Global Account - USD"
    when 1
      @tipo = "Global Account - EUR"
    else
      random_number_tipo = rand(0..10)
      @tipo = case random_number_tipo
              when 0 then "Corrente - BRL"
              when 1 then "Poupança - BRL"
              when 2 then "Salário - BRL"
              when 3 then "Investimento - BRL"
              else "Ruby Global Exchange - RGB"
              end
    end
  end
end