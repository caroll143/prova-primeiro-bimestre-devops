# Relatório do Processo — Prova do Primeiro Bimestre



**Aluno:** Carollini Godoy dos Santos Roque

**RA:** 3925000

**Ferramenta de IA utilizada:** ChatGPT



## Questão 1 — A Jornada Completa (Aulas 01 a 07)



O desenvolvimento da API de Reservas foi realizado seguindo uma sequência que integrou os conteúdos trabalhados durante o bimestre. Primeiro foi criada a estrutura do projeto e utilizado o Git para controlar as versões do código. Foram utilizados commits convencionais e também fluxo com branch de feature e merge. Em seguida, a API Node.js com Express foi implementada com as operações de CRUD para reservas e persistência no PostgreSQL. Depois, a aplicação foi containerizada utilizando Docker, com um Dockerfile para a API. O Docker Compose foi utilizado para executar localmente a API junto com o PostgreSQL, utilizando volume, rede própria, healthcheck e dependência entre os serviços. Na etapa de infraestrutura, o Terraform foi utilizado para criar os recursos da AWS. A infraestrutura foi dividida em módulos de VPC, Security Group, EC2 e RDS. O RDS PostgreSQL foi colocado em sub-redes privadas e a EC2 em uma sub-rede pública. Também foi configurado o estado remoto do Terraform utilizando S3 e DynamoDB para locking. Depois da infraestrutura criada, a API foi executada em um container Docker na EC2 e conectada ao RDS. A conexão com o banco foi configurada utilizando SSL. Por fim, foram realizados testes do healthcheck e de todas as operações do CRUD na infraestrutura AWS.



## Questão 2 — O Processo com IA como Copiloto

A ferramenta de inteligência artificial utilizada durante o desenvolvimento foi o ChatGPT. A IA foi utilizada como copiloto para auxiliar na organização do projeto, na revisão dos arquivos e na resolução de dúvidas durante as etapas de Git, Docker, Docker Compose e Terraform. Entre os principais prompts utilizados estavam solicitações como: “me passe o passo a passo para configurar o Docker Compose”, “analise este erro do Terraform”, “me ajude a validar esta configuração de infraestrutura AWS” e “explique por que a API não está conseguindo conectar ao RDS”. Também foram enviados trechos de arquivos e mensagens de erro para que a IA ajudasse a identificar possíveis causas e indicar os próximos testes. Um dos momentos em que esse apoio foi mais importante ocorreu na conexão da aplicação com o RDS PostgreSQL. A API apresentava falha na conexão com o banco e, após a análise da configuração, foi identificada a necessidade de utilizar SSL na conexão do PostgreSQL. Depois da alteração do arquivo de conexão, a aplicação foi reconstruída e o endpoint `/health` passou a retornar que o banco estava conectado. A IA também ajudou na interpretação das mensagens retornadas pelo PowerShell, Git, Docker e Terraform, facilitando a identificação dos próximos passos. O que a IA fez melhor foi acelerar a pesquisa de soluções, explicar mensagens de erro e organizar o processo em etapas. Porém, algumas orientações precisaram ser conferidas e corrigidas de acordo com o ambiente real, principalmente quando surgiram diferenças entre o comportamento esperado e o resultado apresentado pelos comandos. Comparando com fazer todo o processo manualmente, o uso da IA tornou a investigação de problemas mais rápida e facilitou a compreensão dos comandos, mas não eliminou a necessidade de testar cada alteração. Portanto, a IA foi utilizada como apoio durante o desenvolvimento, enquanto as decisões finais e a validação dos resultados foram realizadas no ambiente real.



## Questão 3 — Infraestrutura, Segurança e Learner Lab



A infraestrutura foi criada na região `us-east-1` utilizando o AWS Academy Learner Lab. A arquitetura possui uma VPC com CIDR `10.0.0.0/16`, sub-redes públicas e privadas distribuídas em duas zonas de disponibilidade. A EC2 foi colocada em uma sub-rede pública para permitir o acesso à aplicação e o gerenciamento da instância. O RDS PostgreSQL foi colocado em sub-redes privadas e configurado para não ser publicamente acessível. A comunicação entre a aplicação e o banco ocorre pela rede privada da VPC. O Security Group do banco permite acesso à porta 5432 somente a partir do Security Group utilizado pela EC2. A EC2 executa a API dentro de um container Docker. O RDS utiliza armazenamento criptografado e a aplicação utiliza conexão SSL com o banco. O estado remoto do Terraform foi configurado em um bucket S3 com versionamento e criptografia, utilizando também uma tabela DynamoDB para locking. Durante o uso do Learner Lab foram utilizadas credenciais temporárias fornecidas pelo ambiente. Não foram criados usuários, grupos ou funções IAM próprias. A infraestrutura foi validada utilizando `terraform validate`, `terraform plan` e `terraform apply`, além de testes reais da API e da conexão com o RDS.



## Questão 4 — Validação e Responsabilidade



Antes de executar o `terraform apply`, foi realizada uma revisão da estrutura dos módulos, das variáveis, dos Security Groups, das sub-redes e das configurações do RDS. Também foram executados `terraform fmt` e `terraform validate` para verificar a configuração. O `terraform plan` foi analisado antes da criação dos recursos para verificar quais alterações seriam realizadas. Durante a implantação, foi verificado se a EC2 estava acessível e se o container da API estava funcionando. A conexão entre a EC2 e o RDS foi testada diretamente utilizando o cliente PostgreSQL e também pela própria aplicação. O endpoint `/health` retornou `{"status":"ok","database":"connected"}`, confirmando que a API conseguia acessar o banco. Também foram realizados testes de POST, GET, PUT e DELETE para confirmar o funcionamento completo do CRUD. A configuração SSL foi necessária para que a aplicação se conectasse corretamente ao RDS. Os resultados foram registrados nas evidências do projeto. Essa validação foi importante porque aceitar código gerado por IA sem revisão poderia gerar configurações incorretas, inseguras ou incompatíveis com o ambiente AWS Academy. O uso do Git, Docker, Terraform e módulos também permitiu revisar cada etapa antes de avançar para a próxima. Assim, a IA foi utilizada como ferramenta de apoio, enquanto as decisões e validações foram realizadas no ambiente de desenvolvimento.



