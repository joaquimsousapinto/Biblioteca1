# Aplicativo Web ASP.NET (.NET Framework) 

## Análise de Requisitos para a criação de uma base de dados para uma Biblioteca Universitária

### Objetivo
O sistema tem como objetivo gerenciar o acervo bibliográfico de uma biblioteca universitária, controlando:
- Livros, autores, editoras e categorias
- Empréstimos e utilizadores
- Facilitação do acesso aos recursos pela comunidade académica

### Requisitos Funcionais

#### 1. Gestão de Editoras
- Registrar informações (nome, morada)
- Manter relação com livros publicados

#### 2. Gestão de Categorias
- Criar/manter categorias (nome, descrição)
- Associar livros a múltiplas categorias

#### 3. Gestão de Livros
- Cadastrar informações básicas (título, ano, edição, exemplares)
- Relacionar com editoras
- Permitir múltiplos autores com ordem de autoria
- Associar a múltiplas categorias

#### 4. Gestão de Autores
- Registrar dados (nome, bibliografia, datas)
- Relacionar com obras

#### 5. Gestão de Utilizadores
- Cadastrar dados pessoais e de contato
- Controlar histórico de empréstimos

#### 6. Gestão de Empréstimos
- Registrar operações (datas, estados)
- Controlar devoluções
- Gerenciar múltiplos itens por empréstimo

### Requisitos Não Funcionais

| Categoria        | Especificação |
|------------------|---------------|
| Desempenho       | Resposta em < 3 seg mesmo com grandes volumes de informação |
| Segurança        | Proteção de dados de utilizadores de acordo com as normas legais |
| Disponibilidade  | 24/7 com manutenção planeada |
| Usabilidade      | Interface intuitiva |
| Integridade      | Validação e consistência de dados |

### Modelo Entidade-Relacionamento

#### Entidades Principais
- **Editora** (publica livros)
- **Categoria** (classificação)
- **Livro** (entidade central)
- **Autor** (escritor)
- **Utilizador** (cliente)
- **EmprestimoEstado** (fluxo)
- **Emprestimo** (transação)

#### Relacionamentos
1. Editora (1) → Livro (N)
2. Livro (M) ↔ Autor (N)
3. Livro (M) ↔ Categoria (N)  
4. Utilizador (1) → Emprestimo (N)
5. EmprestimoEstado (1) → Emprestimo (N)
6. Emprestimo (M) ↔ Livro (N)

#### Atributos Especiais
- `OrdemAutoria`: Hierarquia de autores
- `Quantidade`: Itens por empréstimo
- `Estados`: Controle do ciclo de vida dos empréstimos

> **Nota**: Modelo bem normalizado com integridade referencial garantida por FK.

### Ficheiros para criação e preenchimento da base de dados
- :link: [DML (Data Definition Language)](DDL.sql "DDL")
- :link: [DML (Data Manipulation Language)](DML.sql "DDL")

### Resultado do ORM 
![DbContext](Imagens/DbContext.png "DbContext")
