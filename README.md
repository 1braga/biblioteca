Aluno: Giovanna Braga
Email: gbraga.soria@gmail.com

# Biblioteca Virtual
Este é um projeto desenvolvido como parte do MBA em Desenvolvimento de Software Avançado com foco em RoR. O objetivo é aplicar os conceitos aprendidos em aula para criar uma aplicação web funcional, bem estruturada e com boas práticas de desenvolvimento.

## Tecnologias Utilizadas
- Ruby 3.3.3
- Ruby on Rails 8.0.2
- PostgreSQL
- Bootstrap
- Sidekiq

## Como rodar o projeto localmente
```
# Clone o repositório
git clone https://github.com/1braga/biblioteca.git
cd biblioteca

# Abra o VSCode
# Inicie o projeto dentro do dev container
```

## Funcionalidades implementadas
- Cadastro de usuários
    - Criação de novos usuários com nome e e-mail;
    - Listagem e edição de usuários existentes;
    - Contador de livros lidos por usuário.
- Cadastro de livros
    - Criação de livros com título, autor, e outros atributos;
    - Visualização e gerenciamento dos livros disponíveis.
- Registro de leituras
    - Um usuário pode registrar a leitura de um livro;
    - Registro inclui status da leitura, nota de avaliação e comentário;
    - Exibição de todas as leituras realizadas;
    - Filtro e busca por leituras.
- Atualização automáticca de estatísticas
    - Após cada leitura registrada, o sistema atualiza o total de livros lidos por usuário de forma assíncrona com ActiveJob.

## Conceitos aplicados
Abaixo estão os conceitos aprendidos em aula e aplicados neste projeto, junto com a justificativa de sua utilização:

### 1. Service Object
Utilizado para encapsular regras de negócio específicas fora do controller e dos models, promovendo organização e reutilização do código. Neste projeto, o `RegisterReadingService`ccentraliza a lógica de criação de uma leitura com informações como usuário, livro, status, avaliação e comentário. Isso evita poluir o controller e facilita testes e manutenções futuras.
**Arquivo:** `app/services/register_reading_service.rb`
