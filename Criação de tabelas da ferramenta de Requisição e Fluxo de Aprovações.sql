CREATE TABLE [USUARIO] (
    [Usuario] INT NOT NULL IDENTITY,
    [Nome] VARCHAR(255) NOT NULL,
    [Email] VARCHAR(255) NOT NULL,
	[Status] VARCHAR(10) NOT NULL
    CONSTRAINT [PK_UsuarioID] PRIMARY KEY ([Usuario])
);

CREATE TABLE [STATUS_REQUISICAO] (
    [StatusRequisicao] INT NOT NULL IDENTITY,
    [Status_Requisicao] VARCHAR(10),
    CONSTRAINT [PK_StatusRequisicaoID] PRIMARY KEY ([StatusRequisicao])
);

CREATE TABLE [CATEGORIA] (
    [Categoria] INT NOT NULL IDENTITY,
    [Nome] VARCHAR(255),
    CONSTRAINT [PK_CategoriaID] PRIMARY KEY ([Categoria])
);

CREATE TABLE [ITEM_TIPO] (
    [ItemTipo] INT NOT NULL IDENTITY,
    [Item_Tipo] VARCHAR(7),
    CONSTRAINT [PK_ItemTipoID] PRIMARY KEY ([ItemTipo])
);

CREATE TABLE [REQUISICAO] (
    [Requisicao] INT NOT NULL IDENTITY,
	[Data_Criacao] DATETIME NOT NULL,
    [Descricao] VARCHAR(255),
    [Justificativa] VARCHAR(500),
    [Data_Entrega] DATE,
    [Cidade] VARCHAR(32),
    [CEP] VARCHAR(9), 
    [Estado] CHAR(2),
    [Endereco] VARCHAR(255),
    [Numero] VARCHAR(50),
    [Bairro] VARCHAR(100),
    [Complemento] VARCHAR(255),
    [ItemTipo] INT NOT NULL,
    [StatusRequisicao] INT NOT NULL,
    [UsuarioID] INT NOT NULL,
    CONSTRAINT [PK_Requisicao] PRIMARY KEY ([Requisicao]),
    CONSTRAINT [FK_ItemTipo] FOREIGN KEY ([ItemTipo]) REFERENCES [ITEM_TIPO]([ItemTipo]),
    CONSTRAINT [FK_StatusRequisicao] FOREIGN KEY ([StatusRequisicao]) REFERENCES [STATUS_REQUISICAO]([StatusRequisicao]),
    CONSTRAINT [FK_Usuario] FOREIGN KEY ([UsuarioID]) REFERENCES [USUARIO]([Usuario])
);

CREATE TABLE [SOLICITANTE_APROVADORES] (
    [SolicitanteAprovadores] INT NOT NULL IDENTITY,
    [Solicitante] INT NOT NULL,
    [Aprovador] INT NOT NULL,
    CONSTRAINT [PK_SolicitanteAprovadores] PRIMARY KEY ([SolicitanteAprovadores]),
    CONSTRAINT [FK_Solicitante] FOREIGN KEY ([Solicitante]) REFERENCES [USUARIO]([Usuario]),
    CONSTRAINT [FK_Aprovador] FOREIGN KEY ([Aprovador]) REFERENCES [USUARIO]([Usuario])
);

CREATE TABLE [REQUISICAO_APROVADORES] (
    [RequisicaoAprovadores] INT NOT NULL IDENTITY,
    [Status] CHAR(1),
    [Justificativa] VARCHAR(500),
    [Data_Aprovadores] DATETIME,
    [SolicitanteAprovadores] INT NOT NULL,
    [Requisicao] INT NOT NULL,
    CONSTRAINT [PK_RequisicaoAprovadores] PRIMARY KEY ([RequisicaoAprovadores]),
    CONSTRAINT [FK_Requisicao] FOREIGN KEY ([Requisicao]) REFERENCES [REQUISICAO]([Requisicao])
);

CREATE TABLE [ITEM] (
    [Item] INT NOT NULL IDENTITY,
    [Nome] VARCHAR(255),
    [Preco] DECIMAL(10, 2),
    [Descricao] VARCHAR(255),
    [Descricao_Completa] VARCHAR(500),
    [ItemTipo] INT NOT NULL,
    [Categoria] INT NOT NULL,
    CONSTRAINT [PK_Item] PRIMARY KEY ([Item]),
    CONSTRAINT [FK_Tipo] FOREIGN KEY ([ItemTipo]) REFERENCES [ITEM_TIPO]([ItemTipo]),
    CONSTRAINT [FK_Categoria] FOREIGN KEY ([Categoria]) REFERENCES [CATEGORIA]([Categoria])
);





