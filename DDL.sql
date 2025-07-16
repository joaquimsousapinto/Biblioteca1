CREATE DATABASE Biblioteca1
COLLATE Latin1_General_100_CI_AI;
GO

USE Biblioteca1
GO

CREATE TABLE Editora (
    Id INT PRIMARY KEY,
    -- Outras colunas da tabela Editora
    Nome VARCHAR(256) NOT NULL,
    Morada VARCHAR(1024)
);
GO

CREATE TABLE Categoria (
    Id INT PRIMARY KEY,
    -- Outras colunas da tabela Categoria
    Nome VARCHAR(255) NOT NULL,
    Descricao VARCHAR(1024)
);
GO

CREATE TABLE Livro (
	Id INT PRIMARY KEY NOT NULL IDENTITY,
	Titulo VARCHAR(256),
	AnoPublicacao int NOT NULL,
	EditoraId INT NOT NULL,     -- (FK para Editora)
	AnoEdicao INT NOT NULL,
	Exemplares INT,
	CONSTRAINT FK_Livro_Editora FOREIGN KEY (EditoraId) REFERENCES Editora(Id),
);
GO

CREATE TABLE Autor (
    Id INT PRIMARY KEY NOT NULL IDENTITY,
    Nome VARCHAR(255) NOT NULL,
    Bibliografia VARCHAR(1024),
    DataNascimento DATE,
    DataMorte DATE,
	CONSTRAINT CHK_Autor_Datas CHECK (DataMorte IS NULL OR DataMorte >= DataNascimento)
);
GO

CREATE TABLE LivroAutor         -- (tabela de junção para relação M-N)
(
    LivroId INT NOT NULL,       -- (PK, FK para Livro)
    AutorId INT NOT NULL,       -- (PK, FK para Autor)
    OrdemAutoria INT NOT NULL   -- (para autores principais/coautores)
	CONSTRAINT PK_LivroAutor PRIMARY KEY (LivroId,AutorId),
    CONSTRAINT FK_LivroAutor_Livro FOREIGN KEY (LivroId) REFERENCES Livro(Id),
    CONSTRAINT FK_LivroAutor_Autor FOREIGN KEY (AutorId) REFERENCES Autor(Id),
);
GO

CREATE TABLE LivroCategoria -- (tabela de junção para relação M-N)
(
    LivroId INT NOT NULL,       -- (PK, FK para Livro)
    CategoriaId INT NOT NULL,   -- (PK, FK para Categoria)
	CONSTRAINT PK_LivroCategoria PRIMARY KEY (LivroId,CategoriaId),
    CONSTRAINT FK_LivroCategoria_Livro FOREIGN KEY (LivroId) REFERENCES Livro(Id),
    CONSTRAINT FK_LivroCategoria_Autor FOREIGN KEY (CategoriaId) REFERENCES Categoria(Id),
);
GO
CREATE TABLE EmprestimoEstado       -- (Dicionário de termos para Emprestomo(StatusId)
(
    Id INT PRIMARY KEY IDENTITY,    -- (PK)
    -- Outras colunas da tabela Categoria
    Nome VARCHAR(256) NOT NULL,     -- (Ativo, Concluído, Atrasado)
);
GO

CREATE TABLE Utilizador (
    Id INT PRIMARY KEY IDENTITY,-- (PK)
    -- Outras colunas da tabela Utilizador
    Nome VARCHAR(256) NOT NULL,
    Morada VARCHAR(1024),
	Telefone VARCHAR(64),
	Email VARCHAR(128),
	DataNascimento DATE,
	Sexo CHAR(1) NOT NULL,
);
GO


CREATE TABLE Emprestimo
(
    Id INT NOT NULL PRIMARY KEY IDENTITY,   -- (PK)
    UtilizadorId INT NOT NULL,              -- (FK para Utilizador)
    DataEmprestimo DATE NOT NULL,
    DataDevolucaoPrevista DATE,
    DataDevolucaoReal DATE,
    EstadoId INT NOT NULL,                  -- (FK para EmprestimoEstado)
    CONSTRAINT FK_EmprestimoEstado FOREIGN KEY (EstadoId) REFERENCES EmprestimoEstado(Id),
	CONSTRAINT CHK_Emprestimo_Datas CHECK (DataDevolucaoReal IS NULL OR DataDevolucaoReal >= DataEmprestimo)
);
GO

CREATE TABLE EmprestimoLivro    -- (tabela de junção para relação M-N)
(
    EmprestimoId INT NOT NULL,  -- (PK, FK para Emprestimo)
    LivroId INT NOT NULL,       --(PK, FK para Livro)
    Quantidade INT NOT NULL,
	CONSTRAINT PK_EmprestimoLivro PRIMARY KEY (EmprestimoId,LivroId),
    CONSTRAINT FK_EmprestimoLivro_Emprestimo FOREIGN KEY (EmprestimoId) REFERENCES Emprestimo(Id),
    CONSTRAINT FK_EmprestimoLivro_Livro FOREIGN KEY (LivroId) REFERENCES Livro(Id),
);
GO

