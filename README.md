# Primeiros passos com Apex

## Hello World no VSCode

Bem, "rodar" Apex no VSCode exige que o ambiente seja preparado. Chamamos esse ambiente de SFDX, ou *Salesforce Developer Experience*.

Vale a pena fazer o projeto https://trailhead.salesforce.com/pt-BR/content/learn/projects/quick-start-salesforce-dx, mas aqui temos um passo-a-passo resumido:

- Baixar o VSCode;
- Instalar a extensão "Salesforce Extension Pack";
- Baixar o Java Development Kit versão 8 ou 11 no computador (RunTime Enviroiment não é o sufuciente);
  - configure a variável de ambiente do Java;
- Baixar o Salesforce CLI https://developer.salesforce.com/tools/sfdxcli
- Criar um projeto no VSCode (Ctrl + P -> "SFDX: Create Project")
- Vincule esse novo projeto a uma org salesforce.

## Criando Registros no Developer Console

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

Lembrando que dá para fazer tudo isso normalmente na sua org do Salesforce, ok? ;)



## Triggers Apex (Acionadores)

Sabe quando nós clicamos para 

As triggers fazem algo no banco de dados baseadas em algum evento como, por exemplo, exibir um pop-up na tela depois que o usuário criar um contato. Mas, se a ferramenta Salesforce oferece recursos para disparar alguma funcionalidade, use a solução padrão (point-and-click).

### Estrutura da Trigger

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

