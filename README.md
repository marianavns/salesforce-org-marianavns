# Primeiros passos com Apex

Olá!

☁️ Boas-vindas para quem está chegando no mundo do desenvolvimento Salesforce.  

Aqui temos alguns conceitos básicos e tutoriais para destravar.

Saber um pouco de *programação orientada a objetos* e a *parte administrativa do Salesforce* vai facilitar bastante.

Fique a vontade!

<img src='assets\gif-astro.gif'>



## Sumário

- [Hello World!](#Hello-World)
  - [Hello World no Developer Console](#Hello-World-no-Developer-Console)
  - [Hello World no VSCode](#Hello-World-no-VSCode)
    - [Configurando o Ambiente](#Configurando-o-Ambiente)
    - [Finalmente o Hello World no VSCode](#Finalmente-o-Hello-World-no-VSCode)
- [Manipulando Registros](#Manipulando-Registros)
  - [Criando Registros no Developer Console](#Criando-Registros-No-Developer-Console)
- [Elementos de uma Aplicação Salesforce](#Elementos-de-uma-Aplicação-Salesforce)
  - [Triggers (Acionadores)](#Triggers-Acionadores)
    - [Estrutura da Trigger](#Estrutura-da-Trigger)
- 

## Hello World!

A primeira coisa que queremos fazer quando estamos aprendendo uma linguagem nova é o famoso "Hello, World", certo? Escrever umas linhas de código e ver a mensagem aparecendo no console.

Mas, eu Salesforce, podemos fazer isso usando duas ferramentas: o *Developer Console* e o *VSCode*.

### Hello World no Developer Console

O Developer Console é um ambiente de desenvolvimento que já vem configurado em todas as organizações Salesforce (ou aplicações Salesforce, vamos dizer assim por enquanto).

Para rodar o Hello World, basta:

1. Entrar na sua Org;

2. Clicar em "Developer Console";

   <img src='/assets/readme-1-developer-console.png' width='40%'>

3. Uma nova janela se abrirá. Clique em "New" -> "Apex Class" -> Dê um nome para sua classe. No exemplo abaixo, o nome da classe é "message";

   ```java
   public class message {
       
   }
   ```

4. Crie um método que vai fazer a ação de mostrar a mensagem. Aqui, o método foi nomeado como helloWorld;

   ```java
   public class message {
       public static void helloWorld (){
           System.debug('Hello, World!');
       }
   }
   ```

5. Salve o arquivo;

6. Hora de rodar o código! Clique em "Debug" -> "Open Execute Anonymous Window". Isso equivale a abrir seu prompt de comando ou terminal.

7. Faça a chamada do método: `message.helloWorld();`! É importante que a caixa de seleção "Open Log" esteja marcada. Clique em "Execute".

   <img src='/assets/readme-2-1-code.png' width='50%' >

8. Será exibida uma janela com muita, muita informação mesmo.

   <img src='/assets/readme-2-2-code-debug-only.png' width='50%' >

9. Mas, para ver apenas seu "Hello, World!", clique na caixinha de seleção "debug only". Este última última imagem não será inserida. Queremos que você veja com os próprios olhos ;)

### Hello World no VSCode

Bem, "rodar" um Hello World no VSCode não é tão simples assim, rs. 

Isso porque o ambiente de desenvolvimento Salesforce, por natureza, é o Developer Console lá na sua organização Salesforce. O Developer Console já está rodando dentro do contexto da sua organização, com todos os objetos relacionados, configurações e muitas outras coisas.

E agora?

Para simular esse mesmo ambiente na sua máquina, você precisa "Criar uma Org off-line" no seu computador. Assim, o VSCode terá tudo o que precisa para trabalhar. O ambiente deve ser **preparado**. Chamamos este ambiente preparado de **SFDX**, ou ***Salesforce Developer Experience***.

#### Configurando o Ambiente

Vale a pena fazer o projeto neste link https://trailhead.salesforce.com/pt-BR/content/learn/projects/quick-start-salesforce-dx para aprender a configurar seu ambiente, mas aqui temos um passo-a-passo resumido:

- Baixar o VSCode;
- Instalar a extensão "Salesforce Extension Pack";
- Baixar o Java Development Kit versão 8 ou 11 no computador (RunTime Environment não é o suficiente);
  - Configure a variável de ambiente do Java;
- Baixar o Salesforce CLI https://developer.salesforce.com/tools/sfdxcli
- Criar um projeto no VSCode (Ctrl + P -> "SFDX: Create Project")
- Vincule o novo projeto à sua Org Salesforce.

Ambiente preparado!

#### Finalmente o hello world no VSCode



sfdx force:apex:execute -f "scripts/apex/helloWorld.apex" | grep --line-buffered "USER_DEBUG" 

## Manipulando Registros

As organizações Salesforce geralmente possuem contatos, contas, oportunidades... E cada um desses objetos está lá para que possamos inserir informações, ou registros. Já sabemos como é, por exemplo, a inserção de uma conta na plataforma:

<img src='assets\readme-0-criando-conta.png' width='70%'>

Mas como fazemos isso via código?

### Criando Registros no Developer Console

Para isso, você precisa conhecer o nome do objeto e o nome dos campos que deseja adicionar.

```java
Account contaNova = new Account(
    Name = 'Empresa A',
    YearStarted = '2003',
    Site = 'www.empresaa.com.br',
    NumberOfEmployees = 150
	);
insert contaNova;
```

## Elementos de uma aplicação Salesforce

### Triggers Apex (Acionadores)

As triggers fazem algo no banco de dados baseadas em algum evento como, por exemplo, exibir um pop-up na tela depois que o usuário criar um contato. Mas, se a ferramenta Salesforce oferece recursos para disparar alguma funcionalidade, use a solução padrão (point-and-click).

#### Estrutura da Trigger

**Vamos criar uma trigger que mostre "Hello, World!" no console antes que uma conta seja salva.** Mas, antes, como construir uma trigger? Olhaí a estrutura:

```java
trigger NomeDaTrigger on NomeDoObjeto (MomentoEmQueATriggerSeraDisparada) {

  Codigo

}
```

NomeDaTrigger: Escolha um nome que facilite sua vida e a vida de outros desenvolvedores. ;)

NomeDoObjeto: A trigger vai acontecer sobre que objeto? No nosso exemplo, será no objeto "Account", considerando que ela será disparada quando uma nova conta for criada.

MomentoEmQueATriggerSeraDisparada: aqui temos opções fechadas e autoexplicativas:

![image-20210922080702470](C:\Users\Everymind\AppData\Roaming\Typora\typora-user-images\image-20210922080702470.png)

Código: Mãos à obra! Detalhe o que vai acontecer quando a trigger for disparada!

E assim fica a trigger proposta no começo desta seção:

```java
trigger SayHelloWorld on Account (before insert) {
    System.debug('Hello, World!');
}
```

