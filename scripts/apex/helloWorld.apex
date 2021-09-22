/* 

Para rodar este código no seu VSCode, você precisa ter configurado seu ambiente de desenvolvimento:
## https://github.com/marianavns/salesforce-org-marianavns#Hello-World-no-VSCode ##
depois:
1. Insira no terminal: sfdx force:apex:execute -f "scripts/apex/helloWorld.apex" | grep --line-buffered "USER_DEBUG" 

*/

string name = 'Mariana';
System.debug('Olá, mundo!');
System.debug('Meu nome é ' + name);