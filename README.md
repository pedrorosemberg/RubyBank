![Ruby Bank](https://github.com/pedrorosemberg/RubyBank/blob/main/rubybank.png)

# Ruby Bank

## O que é o Ruby Bank?

O **Ruby Bank** é uma aplicação simples de terminal desenvolvida em Ruby que simula o funcionamento de um banco digital. 

Esta aplicação permite criar contas bancárias, realizar transações financeiras como saques, depósitos e transferências, além de visualizar o histórico de transações de cada conta de forma individualizada.

## Como Utilizar

### Pré-requisitos

Para utilizar o Ruby Bank, você precisa ter o Ruby instalado na sua máquina. Você pode verificar se o Ruby está instalado e qual a versão com o comando:

```
bash
ruby -v
```
Se não estiver instalado, você pode seguir as instruções de instalação em [ruby-lang.org](https://ruby-lang.org).

### Executando o Ruby Bank

Para executar o Ruby Bank, siga os passos abaixo:
1. Clone o repositório ou copie os arquivos do projeto para o seu ambiente de desenvolvimento.
2. No terminal, navegue até o diretório onde os arquivos estão localizados.
3. Execute o seguinte comando:

```
ruby nome_do_arquivo.rb
```

### Menu Principal

Ao executar o Ruby Bank, você será apresentado ao menu principal com as seguintes opções:

- `[1] Criar conta:` Cria uma nova conta bancária para um cliente.
- `[2] Sacar:` Realiza um saque na conta escolhida, descontando o valor do saldo.
- `[3] Depositar:` Realiza um depósito na conta escolhida, aumentando o saldo.
- `[4] Transferir:` Realiza uma transferência de valor entre duas contas.
- `[5] Listar contas:` Lista todas as contas criadas no sistema.
- `[6] Acesso a conta:` Exibe as informações da conta e o histórico de transações.
- `[7] Alterar informações do titular:` Permite alterar as informações do titular da conta.
- `[8] Sair: Encerra o sistema.`

### Funcionalidades

#### 1. Criação de Contas

O sistema permite a criação de contas com informações detalhadas do titular, como nome, CPF, RG, e outros dados pessoais.

#### 2. Transações Bancárias

- **Saque:** Retira um valor da conta, desde que haja saldo suficiente.
- **Depósito:** Adiciona um valor à conta.
- **Transferência:** Permite transferir um valor de uma conta para outra. A conta de origem verá a transação em vermelho, enquanto a conta de destino verá em verde.

#### 3. Histórico de Transações

Cada conta possui um histórico de transações onde é possível visualizar:

- **Saques:** Exibidos em vermelho.
- **Depósitos:** Exibidos em verde.
- **Transferências Enviadas:** Exibidas em vermelho, com a indicação da conta de destino.
- **Transferências Recebidas:** Exibidas em verde, com a indicação da conta de origem.

#### 4. Visualização e Alteração de Dados

- **Consulta de Saldo:** Através da opção de Acesso à Conta, o saldo é mostrado em verde se positivo e em vermelho se zero ou negativo.
- **Alteração de Dados do Titular:** Permite ao usuário atualizar os dados cadastrais do titular da conta.

### Diferenciais do Código

- **Feedback Visual:** Utilização de cores para feedback visual:
-> **Verde** para ações bem-sucedidas.
-> **Vermelho** para ações mal-sucedidas ou de alerta.
-> **Amarelo** para exibição de informações da conta.
- **Histórico de Transações Individualizado:** Cada conta mantém um histórico próprio de suas transações, facilitando a auditoria e o acompanhamento das movimentações financeiras.
- **Interface Simples e Intuitiva:** O sistema é fácil de usar e não requer conhecimentos avançados para operar.
- **Modularidade:** O código está organizado de forma modular, facilitando futuras expansões ou modificações.

### Contribuições
Contribuições para melhorar o Ruby Bank são sempre bem-vindas! 
Para integrar nossa equipe, entre em contato através do e-mail suporte@codever.com.br.

### Licença
Este projeto é de código aberto e está disponível sob a **Licença MIT**, [clique aqui](LICENSA "Ver 'Licensa MIT' by Codever") para saber mais.
Sinta-se livre para utilizar e modificar conforme necessário.

### Sobre o desenvolvedor

O desenvolvedor responsável é [Pedro Rosemberg](https://www.pedrorosemberg.com "Mercadólogo e Desenvolvedor"), que desenvolveu como projeto de estudo da linguagem [Ruby](https://www.ruby-lang.org/pt/downloads/ "A linguagem 'amiga' do programador.").

#### Use. Edite. Só não abuse!
![Ruby Bank](https://github.com/pedrorosemberg/RubyBank/blob/main/rubybank.png)