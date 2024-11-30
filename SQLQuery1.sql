


-- Criação da tabela Utilizadores
CREATE TABLE Utilizador (
    ID_Utilizador INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Username NVARCHAR(50) UNIQUE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Tipo NVARCHAR(20) NOT NULL CHECK (Tipo IN ('Leitor', 'Bibliotecário', 'Administrador')),
    Estado_Conta NVARCHAR(20) NOT NULL CHECK (Estado_Conta IN ('Ativa', 'Bloqueada')),
    Data_Criacao DATETIME DEFAULT GETDATE()
);

-- Criação da tabela Leitores
CREATE TABLE Leitor (
    ID_Leitor INT PRIMARY KEY,
    Morada NVARCHAR(255),
    Data_Registo DATETIME DEFAULT GETDATE(),
    Data_Confirmacao_Registo DATETIME,
    Validacao_Email BIT NOT NULL,
    FOREIGN KEY (ID_Leitor) REFERENCES Utilizador(ID_Utilizador) ON DELETE NO ACTION
);

-- Criação da tabela Bibliotecario
CREATE TABLE Bibliotecarios (
    ID_Bibliotecario INT PRIMARY KEY,
    FOREIGN KEY (ID_Bibliotecario) REFERENCES Utilizador(ID_Utilizador) ON DELETE NO ACTION
);

-- Criação da tabela Administrador
CREATE TABLE Administradores (
    ID_Administrador INT PRIMARY KEY,
    Data_Criacao DATETIME DEFAULT GETDATE(),
    Estado_Conta NVARCHAR(20) NOT NULL CHECK (Estado_Conta IN ('Ativa', 'Bloqueada')),
    FOREIGN KEY (ID_Administrador) REFERENCES Utilizador(ID_Utilizador) ON DELETE NO ACTION
);

-- Criação da tabela Livros
CREATE TABLE Livros (
    ID_Livro INT PRIMARY KEY IDENTITY(1,1),
    Titulo NVARCHAR(255) NOT NULL,
    Autor NVARCHAR(255) NOT NULL,
    Genero NVARCHAR(100),
    ISBN NVARCHAR(20) UNIQUE NOT NULL,
    Preco DECIMAL(10, 2),
    Numero_Exemplares INT NOT NULL,
    Numero_Exemplares_Disponiveis INT NOT NULL,
    Data_Publicacao DATE,
    Editora NVARCHAR(255)
);

-- Criação da tabela Emprestimos
CREATE TABLE Emprestimos (
    ID_Emprestimo INT PRIMARY KEY IDENTITY(1,1),
    ID_Leitor INT,
    ID_Livro INT,
    Data_Emprestimo DATETIME DEFAULT GETDATE(),
    Data_Devolucao_Prevista DATETIME,
    Data_Devolucao_Efetiva DATETIME,
    Estado_Emprestimo NVARCHAR(20) NOT NULL CHECK (Estado_Emprestimo IN ('Ativo', 'Devolvido', 'Atrasado')),
    Notificacao_Atraso BIT NOT NULL,
    FOREIGN KEY (ID_Leitor) REFERENCES Leitor(ID_Leitor) ON DELETE NO ACTION,
    FOREIGN KEY (ID_Livro) REFERENCES Livros(ID_Livro) ON DELETE NO ACTION
);

-- Criação da tabela Notificacoes_Atraso
CREATE TABLE Notificacoes_Atraso (
    ID_Notificacao INT PRIMARY KEY IDENTITY(1,1),
    ID_Emprestimo INT,
    Data_Notificacao DATETIME DEFAULT GETDATE(),
    Estado NVARCHAR(20) NOT NULL CHECK (Estado IN ('Lida', 'Não Lida')),
    FOREIGN KEY (ID_Emprestimo) REFERENCES Emprestimos(ID_Emprestimo) ON DELETE NO ACTION
);

-- Criação da tabela Aprovacoes_Bibliotecarios
CREATE TABLE Aprovacoes_Bibliotecarios (
    ID_Aprovacao INT PRIMARY KEY IDENTITY(1,1),
    ID_Bibliotecario INT,
    ID_Administrador INT,
    Data_Aprovacao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ID_Bibliotecario) REFERENCES Bibliotecarios(ID_Bibliotecario) ON DELETE NO ACTION,
    FOREIGN KEY (ID_Administrador) REFERENCES Utilizador(ID_Utilizador) ON DELETE NO ACTION
);

-- Criação da tabela Bloqueios_Utilizadores
CREATE TABLE Bloqueios_Utilizadores (
    ID_Bloqueio INT PRIMARY KEY IDENTITY(1,1),
    ID_Utilizador INT NOT NULL,
    Motivo NVARCHAR(255) NOT NULL,
    Data_Bloqueio DATETIME DEFAULT GETDATE(),
    Duracao INT NULL,
    FOREIGN KEY (ID_Utilizador) REFERENCES Utilizador(ID_Utilizador) ON DELETE CASCADE
);