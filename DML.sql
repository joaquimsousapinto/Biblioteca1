USE Biblioteca2
GO
-----------------------------------------------------------------

INSERT INTO Editora (Id, Nome, Morada) VALUES
(1, 'Livros & Cia', 'Rua das Letras, 123, Lisboa, Portugal'),
(2, 'Editora Literária', 'Avenida dos Escritores, 45, Porto, Portugal'),
(3, 'Páginas Douradas', 'Travessa das Histórias, 67, Coimbra, Portugal'),
(4, 'Universo dos Livros', 'Praça da Leitura, 89, Braga, Portugal'),
(5, 'Editora Conhecimento', 'Alameda dos Sábios, 34, Faro, Portugal'),
(6, 'Arco-Íris Editorial', 'Beco das Cores, 12, Aveiro, Portugal'),
(7, 'Estrela Polar Edições', 'Largo do Norte, 78, Viseu, Portugal'),
(8, 'Horizonte Cultural', 'Avenida das Artes, 56, Funchal, Madeira'),
(9, 'Magna Editora', 'Rua Magnólia, 90, Ponta Delgada, Açores'),
(10, 'Vento Norte Publicações', 'Travessa do Mar, 23, Viana do Castelo, Portugal');
GO
-----------------------------------------------------------------


INSERT INTO Categoria (Id, Nome, Descricao) VALUES
(1, 'Ficção Científica', 'Livros que exploram conceitos futurísticos, tecnologia avançada e viagens espaciais.'),
(2, 'Fantasia', 'Obras com elementos mágicos, mundos imaginários e criaturas mitológicas.'),
(3, 'Romance', 'Narrativas focadas em relacionamentos amorosos e dramas pessoais.'),
(4, 'Suspense/Thriller', 'Livros que mantêm o leitor em tensão, com reviravoltas e mistérios.'),
(5, 'Não-Ficção', 'Obras baseadas em fatos reais, incluindo biografias, história e ciência.'),
(6, 'Autoajuda', 'Livros que oferecem conselhos para desenvolvimento pessoal e profissional.'),
(7, 'Infantil', 'Livros voltados para crianças, com linguagem simples e ilustrações.'),
(8, 'Terror', 'Histórias que buscam assustar ou causar desconforto psicológico.'),
(9, 'Distopia', 'Narrativas sobre sociedades futuras opressivas ou pós-apocalípticas.'),
(10, 'Negócios', 'Livros sobre empreendedorismo, economia e gestão empresarial.');
GO
-----------------------------------------------------------------


INSERT INTO Livro (Titulo, AnoPublicacao, EditoraId, AnoEdicao, Exemplares) VALUES
-- Livros de Ficção Científica e Fantasia (Editoras 1-3)
('O Guia do Mochileiro das Galáxias', 1979, 1, 2020, 500),
('Duna', 1965, 2, 2019, 300),
('Neuromancer', 1984, 3, 2021, 250),
('Fundação', 1951, 1, 2018, 400),
('O Senhor dos Anéis: A Sociedade do Anel', 1954, 2, 2020, 600),
('1984', 1949, 3, 2017, 450),
('A Revolução dos Bichos', 1945, 1, 2019, 350),
('O Hobbit', 1937, 2, 2021, 550),
('O Problema dos Três Corpos', 2008, 3, 2022, 200),
('O Nome do Vento', 2007, 1, 2020, 500),

-- Romances e Clássicos (Editoras 4-5)
('Orgulho e Preconceito', 1813, 4, 2018, 300),
('Dom Quixote', 1605, 5, 2019, 250),
('Cem Anos de Solidão', 1967, 4, 2021, 400),
('Crime e Castigo', 1866, 5, 2020, 350),
('A Metamorfose', 1915, 4, 2017, 200),
('Grande Sertão: Veredas', 1956, 5, 2019, 300),
('O Retrato de Dorian Gray', 1890, 4, 2020, 280),
('Madame Bovary', 1856, 5, 2018, 320),
('O Apanhador no Campo de Centeio', 1951, 4, 2021, 270),
('Lolita', 1955, 5, 2019, 230),

-- Suspense e Terror (Editoras 6-7)
('It: A Coisa', 1986, 6, 2020, 400),
('O Silêncio dos Inocentes', 1988, 7, 2019, 350),
('O Iluminado', 1977, 6, 2018, 450),
('Gone Girl', 2012, 7, 2021, 380),
('O Código Da Vinci', 2003, 6, 2020, 500),
('A Garota no Trem', 2015, 7, 2019, 300),
('Dracula', 1897, 6, 2017, 280),
('O Exorcista', 1971, 7, 2018, 320),
('Misery', 1987, 6, 2020, 250),
('O Psicopata Americano', 1991, 7, 2019, 270),

-- Não-Ficção e Autoajuda (Editoras 8-9)
('Sapiens: Uma Breve História da Humanidade', 2011, 8, 2020, 600),
('21 Lições para o Século 21', 2018, 9, 2021, 400),
('O Poder do Hábito', 2012, 8, 2019, 350),
('Como Fazer Amigos e Influenciar Pessoas', 1936, 9, 2018, 500),
('A Arte da Guerra', -500, 8, 2020, 450),
('Mindset: A Nova Psicologia do Sucesso', 2006, 9, 2019, 300),
('Os 7 Hábitos das Pessoas Altamente Eficazes', 1989, 8, 2021, 400),
('O Homem Mais Rico da Babilônia', 1926, 9, 2020, 320),
('Rápido e Devagar: Duas Formas de Pensar', 2011, 8, 2019, 280),
('A Sutil Arte de Ligar o F*da-se', 2016, 9, 2021, 350),

-- Infantil e Juvenil (Editora 10)
('O Pequeno Príncipe', 1943, 10, 2020, 800),
('Harry Potter e a Pedra Filosofal', 1997, 10, 2019, 1000),
('Percy Jackson e o Ladrão de Raios', 2005, 10, 2021, 600),
('A Menina que Roubava Livros', 2005, 10, 2018, 400),
('O Diário de Anne Frank', 1947, 10, 2020, 500),
('As Crônicas de Nárnia', 1950, 10, 2019, 450),
('Matilda', 1988, 10, 2021, 350),
('A Culpa é das Estrelas', 2012, 10, 2020, 700),
('Onde Vivem os Monstros', 1963, 10, 2018, 300),
('Alice no País das Maravilhas', 1865, 10, 2019, 550);
GO
-----------------------------------------------------------------

INSERT INTO Autor (Nome, Bibliografia, DataNascimento, DataMorte) VALUES
-- Autores de Ficção Científica/Fantasia
('Douglas Adams', 'Autor britânico de humor absurdo e ficção científica, famoso por "O Guia do Mochileiro das Galáxias".', '1952-03-11', '2001-05-11'),
('Frank Herbert', 'Escritor americano conhecido pela saga "Duna", uma das obras mais influentes da ficção científica.', '1920-10-08', '1986-02-11'),
('William Gibson', 'Pioneiro do cyberpunk, autor de "Neuromancer" e criador do termo "ciberespaço".', '1948-03-17', NULL),
('Isaac Asimov', 'Mestre da ficção científica, criador das "Três Leis da Robótica" e da série "Fundação".', '1920-01-02', '1992-04-06'),
('J.R.R. Tolkien', 'Filólogo e escritor britânico, pai da fantasia moderna com "O Senhor dos Anéis".', '1892-01-03', '1973-09-02'),
('George Orwell', 'Escritor inglês conhecido por distopias como "1984" e "A Revolução dos Bichos".', '1903-06-25', '1950-01-21'),
('Liu Cixin', 'Escritor chinês de ficção científica, vencedor do Prêmio Hugo por "O Problema dos Três Corpos".', '1963-06-23', NULL),
('Patrick Rothfuss', 'Autor americano de fantasia épica, famoso pela série "A Crônica do Matador do Rei".', '1973-06-06', NULL),

-- Autores de Romances/Clássicos
('Jane Austen', 'Romancista britânica, autora de "Orgulho e Preconceito" e "Emma".', '1775-12-16', '1817-07-18'),
('Miguel de Cervantes', 'Escritor espanhol, autor de "Dom Quixote", considerado o primeiro romance moderno.', '1547-09-29', '1616-04-22'),
('Gabriel García Márquez', 'Nobel de Literatura, criador do realismo mágico com "Cem Anos de Solidão".', '1927-03-06', '2014-04-17'),
('Fiódor Dostoiévski', 'Romancista russo, autor de obras profundas como "Crime e Castigo".', '1821-11-11', '1881-02-09'),
('Franz Kafka', 'Escritor tcheco, conhecido por "A Metamorfose" e "O Processo".', '1883-07-03', '1924-06-03'),
('Guimarães Rosa', 'Escritor brasileiro, autor de "Grande Sertão: Veredas".', '1908-06-27', '1967-11-19'),
('Oscar Wilde', 'Escritor irlandês, famoso por "O Retrato de Dorian Gray" e peças de teatro.', '1854-10-16', '1900-11-30'),
('Gustave Flaubert', 'Romancista francês, autor de "Madame Bovary".', '1821-12-12', '1880-05-08'),
('J.D. Salinger', 'Autor americano, conhecido por "O Apanhador no Campo de Centeio".', '1919-01-01', '2010-01-27'),
('Vladimir Nabokov', 'Escritor russo-americano, autor do controverso "Lolita".', '1899-04-22', '1977-07-02'),

-- Autores de Suspense/Terror
('Stephen King', 'Mestre do terror, autor de "It", "O Iluminado" e mais de 60 livros.', '1947-09-21', NULL),
('Thomas Harris', 'Criador do icônico Hannibal Lecter em "O Silêncio dos Inocentes".', '1940-09-22', NULL),
('Gillian Flynn', 'Escritora americana de thrillers psicológicos como "Gone Girl".', '1971-02-24', NULL),
('Dan Brown', 'Autor de thrillers simbólicos, incluindo "O Código Da Vinci".', '1964-06-22', NULL),
('Paula Hawkins', 'Escritora britânica, autora do best-seller "A Garota no Trem".', '1972-08-26', NULL),
('Bram Stoker', 'Escritor irlandês, criador do vampiro "Drácula".', '1847-11-08', '1912-04-20'),
('William Peter Blatty', 'Autor de "O Exorcista", baseado em um caso real de possessão.', '1928-01-07', '2017-01-12'),
('Bret Easton Ellis', 'Escritor polêmico, autor de "O Psicopata Americano".', '1964-03-07', NULL),

-- Autores de Não-Ficção/Autoajuda
('Yuval Noah Harari', 'Historiador israelense, autor da trilogia "Sapiens", "Homo Deus" e "21 Lições".', '1976-02-24', NULL),
('Charles Duhigg', 'Jornalista e escritor, autor de "O Poder do Hábito".', '1974-12-20', NULL),
('Dale Carnegie', 'Pioneiro em livros de desenvolvimento pessoal, como "Como Fazer Amigos...".', '1888-11-24', '1955-11-01'),
('Sun Tzu', 'Estrategista militar chinês, autor do clássico "A Arte da Guerra".', NULL, NULL),
('Carol S. Dweck', 'Psicóloga americana, criadora da teoria do "Mindset".', '1946-10-17', NULL),
('Stephen R. Covey', 'Escritor motivacional, autor de "Os 7 Hábitos das Pessoas Altamente Eficazes".', '1932-10-24', '2012-07-16'),
('George S. Clason', 'Empresário e escritor, autor de "O Homem Mais Rico da Babilônia".', '1874-11-07', '1957-04-05'),
('Daniel Kahneman', 'Nobel de Economia, autor de "Rápido e Devagar".', '1934-03-05', NULL),
('Mark Manson', 'Blogueiro e escritor, conhecido por "A Sutil Arte de Ligar o F*da-se".', '1984-03-09', NULL),

-- Autores de Infantil/Juvenil
('Antoine de Saint-Exupéry', 'Escritor e aviador francês, autor de "O Pequeno Príncipe".', '1900-06-29', '1944-07-31'),
('J.K. Rowling', 'Criadora da série "Harry Potter", uma das autoras mais influentes do século XXI.', '1965-07-31', NULL),
('Rick Riordan', 'Escritor americano, famoso pela série "Percy Jackson".', '1964-06-05', NULL),
('Markus Zusak', 'Autor australiano, conhecido por "A Menina que Roubava Livros".', '1975-06-23', NULL),
('Anne Frank', 'Vítima do Holocausto, autora do célebre diário publicado postumamente.', '1929-06-12', '1945-03-12'),
('C.S. Lewis', 'Escritor britânico, criador de "As Crônicas de Nárnia".', '1898-11-29', '1963-11-22'),
('Roald Dahl', 'Autor de clássicos infantis como "Matilda" e "A Fantástica Fábrica de Chocolate".', '1916-09-13', '1990-11-23'),
('John Green', 'Escritor de YA, autor de "A Culpa é das Estrelas".', '1977-08-24', NULL),
('Maurice Sendak', 'Escritor e ilustrador, criador de "Onde Vivem os Monstros".', '1928-06-10', '2012-05-08'),
('Lewis Carroll', 'Matemático e escritor, autor de "Alice no País das Maravilhas".', '1832-01-27', '1898-01-14');
GO
-----------------------------------------------------------------

INSERT INTO Autor (Nome, Bibliografia, DataNascimento, DataMorte) VALUES
-- Coautores de Ficção Científica/Fantasia
('Brian Herbert', 'Filho de Frank Herbert, coautor das sequências de "Duna".', '1947-06-29', NULL),
('Kevin J. Anderson', 'Escritor de ficção científica, colaborador de "Duna".', '1962-03-27', NULL),

-- Coautores de Não-Ficção
('Jared Diamond', 'Colaborador em obras de história e antropologia.', '1937-09-10', NULL),
('Angela Duckworth', 'Especialista em psicologia do esforço.', '1970-07-01', NULL),

-- Coautores de Suspense
('Mark Olshaker', 'Parceiro de Thomas Harris em thrillers médicos.', '1951-12-19', NULL),
('David Baldacci', 'Escritor de thrillers políticos.', '1960-08-05', NULL),

-- Coautores de Infantil/Juvenil
('Neil Gaiman', 'Colaborador em obras de fantasia juvenil.', '1960-11-10', NULL),
('Brandon Sanderson', 'Coautor em séries de fantasia épica.', '1975-12-19', NULL),

-- Outros coautores
('Margaret Atwood', 'Escritora canadense, colaboradora em antologias.', '1939-11-18', NULL),
('John Scalzi', 'Autor de ficção científica moderna.', '1969-05-10', NULL),
('Diana Gabaldon', 'Especialista em ficção histórica.', '1952-01-11', NULL),
('Malcolm Gladwell', 'Colaborador em não-ficção.', '1963-09-03', NULL),
('Elizabeth Gilbert', 'Escritora de desenvolvimento pessoal.', '1969-07-18', NULL),
('Adam Grant', 'Especialista em psicologia organizacional.', '1981-08-13', NULL),
('Michelle Obama', 'Colaboradora em memórias.', '1964-01-17', NULL),
('Ta-Nehisi Coates', 'Escritor e jornalista.', '1975-09-30', NULL),
('Chimamanda Ngozi Adichie', 'Autora de ficção literária.', '1977-09-15', NULL),
('Colson Whitehead', 'Premiado autor de ficção histórica.', '1969-11-06', NULL),
('Celeste Ng', 'Escritora de dramas familiares.', '1980-07-30', NULL),
('Emily St. John Mandel', 'Autora de ficção distópica.', '1979-01-01', NULL);
GO
-----------------------------------------------------------------

INSERT INTO LivroAutor (LivroId, AutorId, OrdemAutoria) VALUES
-- Ficção Científica/Fantasia (IDs Livro: 1-10, Autores: 1-8)
(1, 1, 1),   -- O Guia do Mochileiro das Galáxias -> Douglas Adams
(2, 2, 1),   -- Duna -> Frank Herbert
(3, 3, 1),   -- Neuromancer -> William Gibson
(4, 4, 1),   -- Fundação -> Isaac Asimov
(5, 5, 1),   -- O Senhor dos Anéis -> J.R.R. Tolkien
(6, 6, 1),   -- 1984 -> George Orwell
(7, 6, 1),   -- A Revolução dos Bichos -> George Orwell
(8, 5, 1),   -- O Hobbit -> J.R.R. Tolkien
(9, 7, 1),   -- O Problema dos Três Corpos -> Liu Cixin
(10, 8, 1),  -- O Nome do Vento -> Patrick Rothfuss

-- Romances/Clássicos (IDs Livro: 11-20, Autores: 9-17)
(11, 9, 1),  -- Orgulho e Preconceito -> Jane Austen
(12, 10, 1), -- Dom Quixote -> Miguel de Cervantes
(13, 11, 1), -- Cem Anos de Solidão -> Gabriel García Márquez
(14, 12, 1), -- Crime e Castigo -> Fiódor Dostoiévski
(15, 13, 1), -- A Metamorfose -> Franz Kafka
(16, 14, 1), -- Grande Sertão: Veredas -> Guimarães Rosa
(17, 15, 1), -- O Retrato de Dorian Gray -> Oscar Wilde
(18, 16, 1), -- Madame Bovary -> Gustave Flaubert
(19, 17, 1), -- O Apanhador no Campo de Centeio -> J.D. Salinger
(20, 18, 1), -- Lolita -> Vladimir Nabokov

-- Suspense/Terror (IDs Livro: 21-30, Autores: 19-26)
(21, 19, 1), -- It: A Coisa -> Stephen King
(22, 20, 1), -- O Silêncio dos Inocentes -> Thomas Harris
(23, 19, 1), -- O Iluminado -> Stephen King
(24, 21, 1), -- Gone Girl -> Gillian Flynn
(25, 22, 1), -- O Código Da Vinci -> Dan Brown
(26, 23, 1), -- A Garota no Trem -> Paula Hawkins
(27, 24, 1), -- Dracula -> Bram Stoker
(28, 25, 1), -- O Exorcista -> William Peter Blatty
(29, 19, 1), -- Misery -> Stephen King
(30, 26, 1), -- O Psicopata Americano -> Bret Easton Ellis

-- Não-Ficção/Autoajuda (IDs Livro: 31-40, Autores: 27-35)
(31, 27, 1), -- Sapiens -> Yuval Noah Harari
(32, 27, 1), -- 21 Lições -> Yuval Noah Harari
(33, 28, 1), -- O Poder do Hábito -> Charles Duhigg
(34, 29, 1), -- Como Fazer Amigos -> Dale Carnegie
(35, 30, 1), -- A Arte da Guerra -> Sun Tzu
(36, 31, 1), -- Mindset -> Carol S. Dweck
(37, 32, 1), -- Os 7 Hábitos -> Stephen R. Covey
(38, 33, 1), -- O Homem Mais Rico da Babilônia -> George S. Clason
(39, 34, 1), -- Rápido e Devagar -> Daniel Kahneman
(40, 35, 1), -- A Sutil Arte... -> Mark Manson

-- Infantil/Juvenil (IDs Livro: 41-50, Autores: 36-45)
(41, 36, 1), -- O Pequeno Príncipe -> Antoine de Saint-Exupéry
(42, 37, 1), -- Harry Potter -> J.K. Rowling
(43, 38, 1), -- Percy Jackson -> Rick Riordan
(44, 39, 1), -- A Menina que Roubava Livros -> Markus Zusak
(45, 40, 1), -- O Diário de Anne Frank -> Anne Frank
(46, 41, 1), -- As Crônicas de Nárnia -> C.S. Lewis
(47, 42, 1), -- Matilda -> Roald Dahl
(48, 43, 1), -- A Culpa é das Estrelas -> John Green
(49, 44, 1), -- Onde Vivem os Monstros -> Maurice Sendak
(50, 45, 1); -- Alice no País das Maravilhas -> Lewis Carroll
GO
-----------------------------------------------------------------

INSERT INTO LivroAutor (LivroId, AutorId, OrdemAutoria) VALUES
-- Duna (LivroId: 2) tem 2 coautores póstumos
(2, 46, 2),   -- Brian Herbert
(2, 47, 3),   -- Kevin J. Anderson

-- O Código Da Vinci (LivroId: 25) tem um coautor
(25, 51, 2),  -- David Baldacci

-- Sapiens (LivroId: 31) tem colaborador
(31, 48, 2),  -- Jared Diamond

-- 21 Lições (LivroId: 32) tem coautora
(32, 54, 2),  -- Margaret Atwood

-- Mindset (LivroId: 36) tem colaboradora
(36, 49, 2),  -- Angela Duckworth

-- O Silêncio dos Inocentes (LivroId: 22) tem coautor
(22, 50, 2),  -- Mark Olshaker

-- Percy Jackson (LivroId: 43) tem coautor
(43, 52, 2),  -- Neil Gaiman

-- As Crônicas de Nárnia (LivroId: 46) tem coautor
(46, 53, 2),  -- Brandon Sanderson

-- A Sutil Arte... (LivroId: 40) tem coautora
(40, 58, 2),  -- Elizabeth Gilbert

-- Rápido e Devagar (LivroId: 39) tem coautor
(39, 57, 2);  -- Malcolm Gladwell
GO
-----------------------------------------------------------------

INSERT INTO LivroCategoria (LivroId, CategoriaId) VALUES
-- Ficção Científica (1)
(1, 1), (2, 1), (3, 1), (4, 1), (9, 1),

-- Fantasia (2)
(5, 2), (8, 2), (10, 2), (42, 2), (46, 2), (50, 2),

-- Romance (3)
(11, 3), (12, 3), (13, 3), (16, 3), (17, 3), (18, 3), (19, 3), (20, 3), (44, 3), (48, 3),

-- Suspense/Thriller (4)
(21, 4), (22, 4), (23, 4), (24, 4), (25, 4), (26, 4), (27, 4), (28, 4), (29, 4), (30, 4),

-- Não-Ficção (5)
(31, 5), (32, 5), (33, 5), (34, 5), (35, 5), (36, 5), (37, 5), (38, 5), (39, 5), (45, 5),

-- Autoajuda (6)
(33, 6), (34, 6), (36, 6), (37, 6), (38, 6), (39, 6), (40, 6),

-- Infantil (7)
(41, 7), (42, 7), (43, 7), (47, 7), (49, 7),

-- Terror (8)
(21, 8), (23, 8), (27, 8), (28, 8), (29, 8),

-- Distopia (9)
(6, 9), (7, 9), (31, 9),  -- Sapiens também tem elementos distópicos

-- Negócios (10)
(35, 10), (37, 10), (38, 10),

-- Adicionando categorias secundárias para enriquecer
(5, 9),   -- Senhor dos Anéis tem elementos distópicos
(10, 3),  -- O Nome do Vento também como Romance
(13, 2),  -- Cem Anos de Solidão como Fantasia mágica
(17, 8),  -- O Retrato de Dorian Gray como Terror psicológico
(20, 4),  -- Lolita como Suspense
(24, 3),  -- Gone Girl como Romance
(30, 9),  -- Psicopata Americano como Distopia
(41, 3),  -- O Pequeno Príncipe como Romance
(44, 5),  -- A Menina que Roubava Livros como Não-Ficção (baseado em fatos)
(48, 7);  -- A Culpa é das Estrelas como Infantil/Juvenil
GO

-----------------------------------------------------------------
INSERT INTO EmprestimoEstado (Nome) VALUES
('Ativo'),             -- Empréstimo em andamento
('Concluído'),         -- Livro devolvido dentro do prazo
('Atrasado'),          -- Livro não devolvido na data prevista
('Renovado'),          -- Empréstimo prolongado
('Perdido'),           -- Livro não devolvido após longo atraso
('Danificado'),        -- Livro devolvido com avarias
('Reservado');         -- Livro reservado para futuro empréstimo
GO
-----------------------------------------------------------------

INSERT INTO Utilizador (Nome, Morada, Telefone, Email, DataNascimento, Sexo) VALUES
('Ana Silva', 'Rua das Flores, 123, Lisboa', '912345678', 'ana.silva@email.com', '1990-05-15', 'F'),
('Bruno Pereira', 'Avenida Central, 45, Porto', '934567890', 'bruno.pereira@email.com', '1985-08-22', 'M'),
('Carla Santos', 'Travessa da Esperança, 67, Braga', '925678901', 'carla.santos@email.com', '1992-03-10', 'F'),
('Diogo Fernandes', 'Praça do Comércio, 89, Coimbra', '967890123', 'diogo.fernandes@email.com', '1988-11-30', 'M'),
('Eva Costa', 'Alameda dos Oceanos, 34, Faro', '918901234', 'eva.costa@email.com', '1995-07-18', 'F'),
('Fábio Martins', 'Beco dos Pinheiros, 12, Aveiro', '939012345', 'fabio.martins@email.com', '1983-01-25', 'M'),
('Gabriela Lopes', 'Largo do Carmo, 78, Viseu', '920123456', 'gabriela.lopes@email.com', '1991-09-05', 'F'),
('Hugo Ribeiro', 'Avenida da Liberdade, 56, Funchal', '961234567', 'hugo.ribeiro@email.com', '1987-04-12', 'M'),
('Inês Almeida', 'Rua da Prata, 90, Ponta Delgada', '912345679', 'ines.almeida@email.com', '1994-12-08', 'F'),
('João Cardoso', 'Travessa do Sol, 23, Viana do Castelo', '935678902', 'joao.cardoso@email.com', '1980-06-20', 'M'),
('Leonor Neves', 'Rua do Ouro, 47, Guarda', '926789013', 'leonor.neves@email.com', '1993-02-14', 'F'),
('Miguel Teixeira', 'Avenida dos Aliados, 31, Santarém', '968901234', 'miguel.teixeira@email.com', '1986-10-03', 'M'),
('Nádia Oliveira', 'Praça da República, 82, Leiria', '919012345', 'nadia.oliveira@email.com', '1997-08-17', 'F'),
('Óscar Pinto', 'Rua dos Combatentes, 19, Setúbal', '930123456', 'oscar.pinto@email.com', '1982-05-28', 'M'),
('Patrícia Gomes', 'Alameda Dom Afonso Henriques, 63, Évora', '962345678', 'patricia.gomes@email.com', '1989-07-22', 'F'),
('Ricardo Marques', 'Bairro dos Pescadores, 7, Portimão', '913456789', 'ricardo.marques@email.com', '1984-04-15', 'M'),
('Sara Dias', 'Rua do Comércio, 54, Vila Real', '934567891', 'sara.dias@email.com', '1996-11-09', 'F'),
('Tiago Sousa', 'Avenida da Boavista, 28, Viseu', '925678912', 'tiago.sousa@email.com', '1981-03-31', 'M'),
('Ulisses Correia', 'Travessa das Oliveiras, 11, Bragança', '967890124', 'ulisses.correia@email.com', '1998-09-26', 'M'),
('Vera Machado', 'Largo dos Lóios, 39, Castelo Branco', '918901235', 'vera.machado@email.com', '1983-12-07', 'F'),
('Alice Monteiro', 'Rua do Sol, 102, Lisboa', '939012346', 'alice.monteiro@email.com', '1990-01-19', 'F'),
('Bernardo Nunes', 'Avenida da República, 205, Porto', '920123457', 'bernardo.nunes@email.com', '1987-06-23', 'M'),
('Cláudia Rocha', 'Praça do Município, 13, Braga', '961234568', 'claudia.rocha@email.com', '1994-04-05', 'F'),
('Daniel Vieira', 'Rua da Alegria, 76, Coimbra', '912345680', 'daniel.vieira@email.com', '1989-10-30', 'M'),
('Eduarda Lima', 'Alameda dos Oceanos, 231, Faro', '935678913', 'eduarda.lima@email.com', '1992-07-12', 'F'),
('Filipe Barbosa', 'Beco da Saudade, 44, Aveiro', '926789024', 'filipe.barbosa@email.com', '1985-02-18', 'M'),
('Gisela Andrade', 'Largo do Chiado, 88, Viseu', '968901235', 'gisela.andrade@email.com', '1997-05-21', 'F'),
('Henrique Fonseca', 'Avenida dos Descobrimentos, 59, Funchal', '919012346', 'henrique.fonseca@email.com', '1980-11-14', 'M'),
('Irina Melo', 'Rua das Pedras, 37, Ponta Delgada', '930123457', 'irina.melo@email.com', '1993-08-27', 'F'),
('Jorge Baptista', 'Travessa do Mar, 92, Viana do Castelo', '962345679', 'jorge.baptista@email.com', '1986-03-09', 'M'),
('Lara Campos', 'Rua do Norte, 15, Guarda', '913456790', 'lara.campos@email.com', '1991-12-03', 'F'),
('Mário Cunha', 'Avenida do Brasil, 204, Santarém', '934567892', 'mario.cunha@email.com', '1984-09-16', 'M'),
('Natacha Pires', 'Praça do Marquês, 71, Leiria', '925678903', 'natacha.pires@email.com', '1999-01-28', 'F'),
('Orlando Miranda', 'Alameda das Linhas de Torres, 63, Setúbal', '967890125', 'orlando.miranda@email.com', '1982-07-11', 'M'),
('Paula Antunes', 'Bairro Alto, 29, Évora', '918901236', 'paula.antunes@email.com', '1987-04-24', 'F'),
('Rúben Tavares', 'Rua da Madalena, 53, Portimão', '939012347', 'ruben.tavares@email.com', '1995-10-07', 'M'),
('Sofia Lourenço', 'Avenida Fontes Pereira de Melo, 126, Vila Real', '920123458', 'sofia.lourenco@email.com', '1988-05-20', 'F'),
('Tomás Xavier', 'Travessa do Fado, 8, Bragança', '961234569', 'tomas.xavier@email.com', '1990-02-13', 'M'),
('Úrsula Ventura', 'Largo do Rato, 97, Castelo Branco', '912345681', 'ursula.ventura@email.com', '1983-11-26', 'F'),
('Vasco Rebelo', 'Rua do Alecrim, 32, Lisboa', '935678914', 'vasco.rebelo@email.com', '1996-08-09', 'M'),
('Wanda Pinho', 'Avenida da Igreja, 143, Porto', '926789025', 'wanda.pinho@email.com', '1981-03-22', 'F'),
('Xavier Queirós', 'Praça das Flores, 67, Braga', '968901236', 'xavier.queiros@email.com', '1994-12-15', 'M'),
('Yara Simões', 'Rua do Salitre, 82, Coimbra', '919012347', 'yara.simoes@email.com', '1989-07-28', 'F'),
('Zé Pedro Valente', 'Alameda dos Oceanos, 215, Faro', '930123458', 'zepedro.valente@email.com', '1982-04-10', 'M'),
('Alexandra Rosa', 'Beco das Estrelas, 11, Aveiro', '962345680', 'alexandra.rosa@email.com', '1997-01-23', 'F'),
('Diana Faria', 'Largo do Carmo, 55, Viseu', '913456791', 'diana.faria@email.com', '1985-06-06', 'F'),
('Gustavo Matos', 'Avenida da Liberdade, 201, Funchal', '934567893', 'gustavo.matos@email.com', '1992-11-19', 'M'),
('Helena Bento', 'Rua da Prata, 88, Ponta Delgada', '925678904', 'helena.bento@email.com', '1980-08-02', 'F'),
('Ivo Candeias', 'Travessa do Sol, 33, Viana do Castelo', '967890126', 'ivo.candeias@email.com', '1993-05-25', 'M'),
('Júlia Frade', 'Rua do Ouro, 12, Guarda', '918901237', 'julia.frade@email.com', '1986-12-08', 'F');
GO
-----------------------------------------------------------------


INSERT INTO Emprestimo (UtilizadorId, DataEmprestimo, DataDevolucaoPrevista, DataDevolucaoReal, EstadoId) VALUES
-- Empréstimos ativos (EstadoId: 1)
(1, '2023-10-01', '2023-10-15', NULL, 1),
(2, '2023-10-02', '2023-10-16', NULL, 1),
(3, '2023-10-03', '2023-10-17', NULL, 1),

-- Empréstimos concluídos (EstadoId: 2)
(4, '2023-09-01', '2023-09-15', '2023-09-14', 2),
(5, '2023-09-05', '2023-09-19', '2023-09-18', 2),
(1, '2023-09-10', '2023-09-24', '2023-09-23', 2),
(6, '2023-09-15', '2023-09-29', '2023-09-28', 2),
(7, '2023-09-20', '2023-10-04', '2023-10-03', 2),

-- Empréstimos atrasados (EstadoId: 3)
(8, '2023-09-01', '2023-09-15', NULL, 3),
(9, '2023-09-10', '2023-09-24', NULL, 3),
(10, '2023-09-15', '2023-09-29', NULL, 3),

-- Empréstimos renovados (EstadoId: 4)
(11, '2023-09-05', '2023-10-05', NULL, 4),
(12, '2023-09-10', '2023-10-10', NULL, 4),
(13, '2023-09-15', '2023-10-15', NULL, 4),

-- Empréstimos perdidos (EstadoId: 5)
(14, '2023-06-01', '2023-06-15', NULL, 5),
(15, '2023-06-10', '2023-06-24', NULL, 5),

-- Empréstimos com livros danificados (EstadoId: 6)
(16, '2023-08-01', '2023-08-15', '2023-08-14', 6),
(17, '2023-08-05', '2023-08-19', '2023-08-18', 6),

-- Reservas (EstadoId: 7)
(18, '2023-10-01', '2023-10-08', NULL, 7),
(19, '2023-10-02', '2023-10-09', NULL, 7),
(20, '2023-10-03', '2023-10-10', NULL, 7),

-- Empréstimos com devoluções variadas
(21, '2023-08-10', '2023-08-24', '2023-08-25', 3),  -- Devolvido com atraso
(22, '2023-08-15', '2023-08-29', '2023-08-30', 3),
(23, '2023-08-20', '2023-09-03', '2023-09-02', 2),
(24, '2023-07-01', '2023-07-15', '2023-07-16', 3),
(25, '2023-07-05', '2023-07-19', '2023-07-18', 2),
(26, '2023-07-10', '2023-07-24', '2023-07-25', 3),
(27, '2023-07-15', '2023-07-29', '2023-07-28', 2),
(28, '2023-06-20', '2023-07-04', '2023-07-05', 3),
(29, '2023-06-25', '2023-07-09', NULL, 5),           -- Perdido
(30, '2023-05-01', '2023-05-15', '2023-05-20', 6);   -- Danificado
GO
-----------------------------------------------------------------


INSERT INTO EmprestimoLivro (EmprestimoId, LivroId, Quantidade) VALUES
-- Empréstimos individuais
(1, 42, 1),                 -- USER001: Harry Potter
(2, 5, 1),                  -- USER002: Senhor dos Anéis
(3, 31, 1),                 -- USER003: Sapiens

-- Empréstimos múltiplos
(4, 11, 1), (4, 17, 1),   -- USER004: Orgulho+Preconceito + Retrato de Dorian Gray
(5, 21, 1), (5, 23, 1),   -- USER005: It + O Iluminado
(6, 35, 1),               -- USER001: A Arte da Guerra
(7, 41, 1), (7, 50, 1),   -- USER006: Pequeno Príncipe + Alice

-- Empréstimos atrasados
(8, 25, 1),               -- USER008: O Código Da Vinci
(9, 32, 1),               -- USER009: 21 Lições
(10, 39, 1),              -- USER010: Rápido e Devagar

-- Renovações
(11, 2, 1), (11, 4, 1),  -- USER011: Duna + Fundação
(12, 10, 1),              -- USER012: O Nome do Vento
(13, 13, 1),              -- USER013: Cem Anos de Solidão

-- Perdidos/Danificados
(14, 1, 1),               -- USER014: Guia do Mochileiro
(15, 3, 1),               -- USER015: Neuromancer
(16, 7, 1),               -- USER016: Revolução dos Bichos (danificado)
(17, 19, 1),              -- USER017: Apanhador no Campo de Centeio (danificado)

-- Reservas
(18, 8, 1),               -- USER018: O Hobbit
(19, 22, 1),              -- USER019: O Silêncio dos Inocentes
(20, 37, 1),              -- USER020: Os 7 Hábitos

-- Outros empréstimos
(21, 6, 1),               -- USER021: 1984 (devolvido com atraso)
(22, 9, 1),               -- USER022: O Problema dos 3 Corpos
(23, 14, 1),              -- USER023: Crime e Castigo
(24, 16, 1),              -- USER024: Grande Sertão: Veredas
(25, 18, 1),              -- USER025: Madame Bovary
(26, 20, 1),              -- USER026: Lolita
(27, 24, 1),              -- USER027: Gone Girl
(28, 27, 1),              -- USER028: Drácula
(29, 29, 1),              -- USER029: Misery (perdido)
(30, 33, 1);              -- USER030: O Poder do Hábito (danificado)
GO
-----------------------------------------------------------------
