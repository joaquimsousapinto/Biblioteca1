USE master; -- Conecta-se à base de dados master, pois não se pode apagar a base de dados em que se está conectado.
GO

DECLARE @dbName NVARCHAR(128) = N'Biblioteca1';

IF EXISTS (SELECT name FROM sys.databases WHERE name = @dbName)
BEGIN
    PRINT 'A base de dados ' + @dbName + ' existe. A tentar fechar conexões e apagar...';

    -- Define a base de dados para o modo SINGLE_USER para terminar todas as conexões
    ALTER DATABASE Biblioteca1 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    PRINT 'Base de dados ' + @dbName + ' definida para SINGLE_USER com ROLLBACK IMMEDIATE.';

    -- Apaga a base de dados
    DROP DATABASE Biblioteca1;
    PRINT 'Base de dados ' + @dbName + ' apagada com sucesso.';
END
ELSE
BEGIN
    PRINT 'A base de dados ' + @dbName + ' não existe. Nenhuma ação necessária.';
END
GO


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
    Nome VARCHAR(256) NOT NULL,
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
    Nome VARCHAR(256) NOT NULL,
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
    EstadoId INT NOT NULL,                  -- (FK para EmprestimoEstado)
    DataEmprestimo DATE NOT NULL,
    DataDevolucaoPrevista DATE,
    DataDevolucaoReal DATE,
    CONSTRAINT FK_Emprestimo_Utilizador FOREIGN KEY (UtilizadorId) REFERENCES Utilizador(Id),
    CONSTRAINT FK_Emprestimo_EmprestimoEstado FOREIGN KEY (EstadoId) REFERENCES EmprestimoEstado(Id),
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

-- =============================================
-- Author:		Joaquim Sousa Pinto
-- Create date: 2025-07-16
-- Description:	Distribuição por sexo e faixa etária
-- =============================================
CREATE PROCEDURE [dbo].[SP_Utilizadores_Sexo_FaixaEtaria] 
	-- Add the parameters for the stored procedure here
	@ExecutionTime INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @StartTime DATETIME = GETDATE();
	-- 
    SELECT  Sexo,
        CASE 
            WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 18 AND 25 THEN '18-25'
            WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
            WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
            ELSE '46+'
        END AS FaixaEtaria,
        COUNT(*) AS Total
    FROM  Utilizador
    GROUP BY  Sexo,
        CASE 
            WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 18 AND 25 THEN '18-25'
            WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
            WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
            ELSE '46+'
        END
    ORDER BY FaixaEtaria, Sexo;
    SET @ExecutionTime = DATEDIFF(MILLISECOND, @StartTime, GETDATE());
END
GO

-- =============================================
-- Author:		Joaquim Sousa Pinto
-- Create date: 2025-07-19
-- Description:	Livros por Categoria
-- =============================================
CREATE PROCEDURE SP_Livros_Categoria 
	-- Add the parameters for the stored procedure here
	@ExecutionTime INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @StartTime DATETIME = GETDATE();

	SELECT Categoria.Nome, COUNT(*) As Total
		FROM LivroCategoria
		INNER JOIN Categoria ON LivroCategoria.CategoriaId = Categoria.Id
		GROUP BY Categoria.Nome
		ORDER BY Categoria.Nome

    SET @ExecutionTime = DATEDIFF(MILLISECOND, @StartTime, GETDATE());
END
GO

-- Índices para Chaves Estrangeiras (FKs):
CREATE INDEX IX_Livro_EditoraId ON Livro (EditoraId);
CREATE INDEX IX_LivroAutor_AutorId ON LivroAutor (AutorId);
CREATE INDEX IX_LivroCategoria_CategoriaId ON LivroCategoria (CategoriaId);
CREATE INDEX IX_Emprestimo_UtilizadorId ON Emprestimo (UtilizadorId);
CREATE INDEX IX_Emprestimo_EstadoId ON Emprestimo (EstadoId);
CREATE INDEX IX_EmprestimoLivro_LivroId ON EmprestimoLivro (LivroId);
GO

-- Índices para Colunas de Pesquisa Frequente:
CREATE INDEX IX_Livro_Titulo ON Livro (Titulo);
CREATE INDEX IX_Autor_Nome ON Autor (Nome);
CREATE INDEX IX_Utilizador_Nome ON Utilizador (Nome);
CREATE INDEX IX_Utilizador_Email ON Utilizador (Email);
CREATE INDEX IX_Emprestimo_DataEmprestimo ON Emprestimo (DataEmprestimo);
CREATE INDEX IX_Emprestimo_DataDevolucaoPrevista ON Emprestimo (DataDevolucaoPrevista);
GO

-- Índices para Colunas Utilizadas em ORDER BY e GROUP BY:
CREATE INDEX IX_Livro_AnoPublicacao ON Livro (AnoPublicacao);
CREATE INDEX IX_Autor_DataNascimento ON Autor (DataNascimento);
GO

--- Problema meu ... não repetível
ALTER AUTHORIZATION ON DATABASE::[Biblioteca1] TO [sa];
GO
