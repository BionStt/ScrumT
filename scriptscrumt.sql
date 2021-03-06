USE [master]
GO
/****** Object:  Database [Scrumt]    Script Date: 29/11/2016 09:49:58 ******/
CREATE DATABASE [Scrumt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scrumt', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Scrumt.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Scrumt_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Scrumt_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Scrumt] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scrumt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scrumt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scrumt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scrumt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scrumt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scrumt] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scrumt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Scrumt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scrumt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scrumt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scrumt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scrumt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scrumt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scrumt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scrumt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scrumt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Scrumt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scrumt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scrumt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scrumt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scrumt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scrumt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scrumt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scrumt] SET RECOVERY FULL 
GO
ALTER DATABASE [Scrumt] SET  MULTI_USER 
GO
ALTER DATABASE [Scrumt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scrumt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scrumt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scrumt] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Scrumt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Scrumt', N'ON'
GO
USE [Scrumt]
GO
/****** Object:  Table [dbo].[Equipe]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipe](
	[ID_ProjUser] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NULL,
	[ID_Projeto] [int] NULL,
 CONSTRAINT [PK_ProjUsers] PRIMARY KEY CLUSTERED 
(
	[ID_ProjUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Funcao]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Funcao](
	[ID_Funcao] [int] IDENTITY(1,1) NOT NULL,
	[Nome_Funcao] [varchar](50) NULL,
 CONSTRAINT [PK_Funcao] PRIMARY KEY CLUSTERED 
(
	[ID_Funcao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Backlog]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Backlog](
	[ID_PBacklog] [int] IDENTITY(1,1) NOT NULL,
	[ID_Projeto] [int] NULL,
	[Historia] [varchar](50) NULL,
	[Aceito] [varchar](50) NULL,
	[Importancia] [varchar](50) NULL,
 CONSTRAINT [PK_Product_Backlog] PRIMARY KEY CLUSTERED 
(
	[ID_PBacklog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Release]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Release](
	[ID_ProductRelease] [int] IDENTITY(1,1) NOT NULL,
	[ID_PBacklog] [int] NULL,
	[ID_Membro] [int] NULL,
	[ID_Release] [int] NULL,
	[Estimativa_Inicio] [date] NULL,
	[Estimativa_Fim] [date] NULL,
	[Situacao_QuadroTarefas] [varchar](50) NULL,
 CONSTRAINT [PK_Product_Release] PRIMARY KEY CLUSTERED 
(
	[ID_ProductRelease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projeto]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projeto](
	[ID_Projeto] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
	[Data_Inicio] [date] NULL,
	[Data_Fim] [date] NULL,
 CONSTRAINT [PK_Projeto] PRIMARY KEY CLUSTERED 
(
	[ID_Projeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Release_Backlog]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release_Backlog](
	[ID_Release] [int] NOT NULL,
	[ID_Projeto] [int] NULL,
	[Data_Inicio] [date] NULL,
 CONSTRAINT [PK_Release_Backlog] PRIMARY KEY CLUSTERED 
(
	[ID_Release] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sprint]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sprint](
	[ID_Sprint] [int] NOT NULL,
	[ID_Release] [int] NULL,
	[Data_Entrega] [date] NULL,
 CONSTRAINT [PK_Sprint] PRIMARY KEY CLUSTERED 
(
	[ID_Sprint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teste_Integracao]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teste_Integracao](
	[ID_TesteIntegracao] [int] IDENTITY(1,1) NOT NULL,
	[Data_Teste] [date] NULL,
	[Versao_Testada] [varchar](50) NULL,
	[ID_PBacklog] [int] NULL,
	[ID_Membro] [int] NULL,
	[Relatorio_Log] [varchar](50) NULL,
	[Erros] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Teste_Integracao] PRIMARY KEY CLUSTERED 
(
	[ID_TesteIntegracao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teste_Unidade]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teste_Unidade](
	[ID_TestUnidade] [int] IDENTITY(1,1) NOT NULL,
	[ID_Membro] [int] NULL,
	[ID_Backlog] [int] NULL,
	[Classe] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Teste_Unidade] PRIMARY KEY CLUSTERED 
(
	[ID_TestUnidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_Equipe] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ID_Funcao] [int] NULL CONSTRAINT [DF_Users_ID_Funcao]  DEFAULT ((2)),
	[Senha] [nvarchar](10) NULL CONSTRAINT [DF_Equipe_Senha]  DEFAULT ((123)),
 CONSTRAINT [PK_Colaborador] PRIMARY KEY CLUSTERED 
(
	[ID_Equipe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Equipe]  WITH CHECK ADD  CONSTRAINT [FK_ProjUsers_Projeto] FOREIGN KEY([ID_Projeto])
REFERENCES [dbo].[Projeto] ([ID_Projeto])
GO
ALTER TABLE [dbo].[Equipe] CHECK CONSTRAINT [FK_ProjUsers_Projeto]
GO
ALTER TABLE [dbo].[Equipe]  WITH CHECK ADD  CONSTRAINT [FK_ProjUsers_Users] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Users] ([ID_Equipe])
GO
ALTER TABLE [dbo].[Equipe] CHECK CONSTRAINT [FK_ProjUsers_Users]
GO
ALTER TABLE [dbo].[Product_Backlog]  WITH CHECK ADD  CONSTRAINT [FK_Product_Backlog_Projeto] FOREIGN KEY([ID_Projeto])
REFERENCES [dbo].[Projeto] ([ID_Projeto])
GO
ALTER TABLE [dbo].[Product_Backlog] CHECK CONSTRAINT [FK_Product_Backlog_Projeto]
GO
ALTER TABLE [dbo].[Product_Release]  WITH CHECK ADD  CONSTRAINT [FK_Product_Release_Product_Backlog] FOREIGN KEY([ID_PBacklog])
REFERENCES [dbo].[Product_Backlog] ([ID_PBacklog])
GO
ALTER TABLE [dbo].[Product_Release] CHECK CONSTRAINT [FK_Product_Release_Product_Backlog]
GO
ALTER TABLE [dbo].[Product_Release]  WITH CHECK ADD  CONSTRAINT [FK_Product_Release_Release_Backlog] FOREIGN KEY([ID_Release])
REFERENCES [dbo].[Release_Backlog] ([ID_Release])
GO
ALTER TABLE [dbo].[Product_Release] CHECK CONSTRAINT [FK_Product_Release_Release_Backlog]
GO
ALTER TABLE [dbo].[Product_Release]  WITH CHECK ADD  CONSTRAINT [FK_Product_Release_Users] FOREIGN KEY([ID_Membro])
REFERENCES [dbo].[Users] ([ID_Equipe])
GO
ALTER TABLE [dbo].[Product_Release] CHECK CONSTRAINT [FK_Product_Release_Users]
GO
ALTER TABLE [dbo].[Release_Backlog]  WITH CHECK ADD  CONSTRAINT [FK_Release_Backlog_Projeto] FOREIGN KEY([ID_Projeto])
REFERENCES [dbo].[Projeto] ([ID_Projeto])
GO
ALTER TABLE [dbo].[Release_Backlog] CHECK CONSTRAINT [FK_Release_Backlog_Projeto]
GO
ALTER TABLE [dbo].[Sprint]  WITH CHECK ADD  CONSTRAINT [FK_Sprint_Release_Backlog] FOREIGN KEY([ID_Release])
REFERENCES [dbo].[Release_Backlog] ([ID_Release])
GO
ALTER TABLE [dbo].[Sprint] CHECK CONSTRAINT [FK_Sprint_Release_Backlog]
GO
ALTER TABLE [dbo].[Teste_Integracao]  WITH CHECK ADD  CONSTRAINT [FK_Teste_Integracao_Product_Backlog] FOREIGN KEY([ID_PBacklog])
REFERENCES [dbo].[Product_Backlog] ([ID_PBacklog])
GO
ALTER TABLE [dbo].[Teste_Integracao] CHECK CONSTRAINT [FK_Teste_Integracao_Product_Backlog]
GO
ALTER TABLE [dbo].[Teste_Integracao]  WITH CHECK ADD  CONSTRAINT [FK_Teste_Integracao_Users] FOREIGN KEY([ID_Membro])
REFERENCES [dbo].[Users] ([ID_Equipe])
GO
ALTER TABLE [dbo].[Teste_Integracao] CHECK CONSTRAINT [FK_Teste_Integracao_Users]
GO
ALTER TABLE [dbo].[Teste_Unidade]  WITH CHECK ADD  CONSTRAINT [FK_Teste_Unidade_Product_Backlog] FOREIGN KEY([ID_Backlog])
REFERENCES [dbo].[Product_Backlog] ([ID_PBacklog])
GO
ALTER TABLE [dbo].[Teste_Unidade] CHECK CONSTRAINT [FK_Teste_Unidade_Product_Backlog]
GO
ALTER TABLE [dbo].[Teste_Unidade]  WITH CHECK ADD  CONSTRAINT [FK_Teste_Unidade_Users] FOREIGN KEY([ID_Membro])
REFERENCES [dbo].[Users] ([ID_Equipe])
GO
ALTER TABLE [dbo].[Teste_Unidade] CHECK CONSTRAINT [FK_Teste_Unidade_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Equipe_Funcao] FOREIGN KEY([ID_Funcao])
REFERENCES [dbo].[Funcao] ([ID_Funcao])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Equipe_Funcao]
GO
/****** Object:  StoredProcedure [dbo].[SP_FUNCAO_BYID]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_FUNCAO_BYID]
@nome nvarchar(50)
AS
SELECT * FROM Funcao
  where Nome_Funcao = @nome


GO
/****** Object:  StoredProcedure [dbo].[SP_PBACKLOG_DELETE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PBACKLOG_DELETE]
@ID_PBacklog INT
AS
DELETE FROM Product_Backlog WHERE ID_PBacklog=@ID_PBacklog



GO
/****** Object:  StoredProcedure [dbo].[SP_PBACKLOG_INCLUIR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PBACKLOG_INCLUIR]
@IDProjeto int,
@Historia nvarchar(50),
@Importancia nvarchar(50),
@Aceito nvarchar(50),
@ID_PBacklog INT OUTPUT
AS
INSERT INTO [dbo].[Product_Backlog]
           (Product_Backlog.[ID_Projeto],
		   [Historia],
		   [Importancia],
		   [Aceito])
     VALUES
           (@IDProjeto,
		   @Historia,
		   @Importancia,
		   @Aceito)



GO
/****** Object:  StoredProcedure [dbo].[SP_PBACKLOG_LIST_BYID]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PBACKLOG_LIST_BYID]
@IDProjeto int
AS
SELECT [ID_Projeto]
      ,[Historia]
	  ,[Importancia]
	  ,[Aceito]
  FROM Product_Backlog
  where ID_Projeto = @IDProjeto



GO
/****** Object:  StoredProcedure [dbo].[SP_PBACKLOG_UPDATE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_PBACKLOG_UPDATE]
@IDProjeto int,
@Historia nvarchar(50),
@Importancia nvarchar(50),
@Aceito nvarchar(50),
@ID INT
AS
UPDATE Product_Backlog
   SET [ID_Projeto] = @IDProjeto,
	   [Historia] = @Historia,
	   [Importancia] = @Importancia,
	   [Aceito] = @Aceito
 WHERE ID_PBacklog=@ID

/****** DETALHES     ******/


GO
/****** Object:  StoredProcedure [dbo].[SP_PROJETO_DELETE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PROJETO_DELETE]
@ID INT
AS
DELETE FROM Projeto WHERE ID=@ID



GO
/****** Object:  StoredProcedure [dbo].[SP_PROJETO_DETALHES]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_PROJETO_DETALHES]
@ID_Projeto INT
AS
SELECT [ID]
      ,[Descricao]
	  ,[Data_Inicio]
	  ,[Data_Fim]
  FROM Projeto
  where ID = @ID_Projeto

GO
/****** Object:  StoredProcedure [dbo].[SP_PROJETO_INCLUIR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PROJETO_INCLUIR]
@Descricao NVARCHAR(50),
@DataInicio DATETIME,
@Datafim DATETIME,
@ID_Projeto INT OUTPUT
AS
INSERT INTO [dbo].[PROJETO]
           ([Descricao],
		   [Data_Inicio],
		   [Data_Fim])
     VALUES
           (@Descricao,
		   @DataInicio,
		   @Datafim)



GO
/****** Object:  StoredProcedure [dbo].[SP_PROJETO_LISTAR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_PROJETO_LISTAR]
AS
SELECT [ID]
      ,[Descricao]
	  ,[Data_Inicio]
	  ,[Data_Fim]
  FROM Projeto

/****** UPDATE    ******/

GO
/****** Object:  StoredProcedure [dbo].[SP_PROJETO_UPDATE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_PROJETO_UPDATE]
@ID_Projeto INT,
@Descricao NVARCHAR(50),
@Data_Inicio DateTime,
@Data_Fim Datetime

AS
UPDATE Projeto
   SET [Descricao] = @Descricao,
	   [Data_Inicio] = @Data_Inicio,
	   [Data_Fim] = @Data_Fim
 WHERE ID=@ID_Projeto

/****** DETALHES     ******/


GO
/****** Object:  StoredProcedure [dbo].[SP_PROJUSER_INCLUIR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PROJUSER_INCLUIR]
@ID_User int,
@Projeto int,
@ID_ProjUser INT OUTPUT
AS
INSERT INTO [dbo].[EQUIPE]
           ([ID_User],
		   [ID_Projeto])
     VALUES
           (@ID_User,
		   @ID_ProjUser)



GO
/****** Object:  StoredProcedure [dbo].[SP_RBACKLOG_DELETE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_RBACKLOG_DELETE]
@ID_RBacklog INT
AS
DELETE FROM Product_Release WHERE ID_ProductRelease =@ID_RBacklog



GO
/****** Object:  StoredProcedure [dbo].[SP_RBACKLOG_INCLUIR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_RBACKLOG_INCLUIR]
@IDMembro int,
@IDPbacklog int,
@Estimativai Date,
@Estimativaf Date,
@Situacao nvarchar(50),
@ID_RBacklog INT OUTPUT
AS
INSERT INTO [dbo].[Product_Release]
           ([ID_Membro],
		   [ID_PBacklog],
		   [Estimativa_Inicio],
		   [Estimativa_Fim],
		   [Situacao_QuadroTarefas])
     VALUES
           (@IDMembro,
		   @IDPbacklog,
		   @Estimativai,
		   @Estimativaf,
		   @Situacao)



GO
/****** Object:  StoredProcedure [dbo].[SP_RBACKLOG_UPDATE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_RBACKLOG_UPDATE]
@ID_Membro int,
@ID_PBacklog int,
@Estimativai Date,
@Estimativaf Date,
@Situacao nvarchar(50),
@ID INT
AS
UPDATE Product_Release
   SET [ID_Membro] = @ID_Membro,
	   [ID_PBacklog] = @ID_PBacklog,
	   [Estimativa_Inicio] = @Estimativai,
	   [Estimativa_Fim] = @Estimativaf,
	   [Situacao_QuadroTarefas] = @Situacao
	   
 WHERE ID_ProductRelease=@ID

/****** DETALHES     ******/


GO
/****** Object:  StoredProcedure [dbo].[SP_TESTEINTEGRACAO_DELETE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TESTEINTEGRACAO_DELETE]
@ID_TestIntegracao INT
AS
DELETE FROM Teste_Integracao WHERE ID_TesteIntegracao=@ID_TestIntegracao



GO
/****** Object:  StoredProcedure [dbo].[SP_TESTEINTEGRACAO_INCLUIR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TESTEINTEGRACAO_INCLUIR]
@ID_Membro int,
@ID_Backlog int,
@Relatorio NVARCHAR(50),
@DataTeste Date,
@Erros NVARCHAR(50),
@Versao NVARCHAR(50),
@Status NVARCHAR(50),
@ID_TestIntegracao INT OUTPUT
AS
INSERT INTO [dbo].[Teste_Integracao]
           ([ID_Membro],
		   [ID_PBacklog],
		   [Relatorio_Log],
		   [Data_Teste],
		   [Erros],
		   [Versao_Testada],
		   [Status])
     VALUES
           (@ID_Membro,
		   @ID_Backlog,
		   @Relatorio,
		   @DataTeste,
		   @Erros,
		   @Versao,
		   @Status)



GO
/****** Object:  StoredProcedure [dbo].[SP_TESTEINTEGRACAO_UPDATE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_TESTEINTEGRACAO_UPDATE]
@ID_Membro int,
@ID_Backlog int,
@Data Date,
@Erros NVARCHAR(50),
@Relatorio NVARCHAR(50),
@Versao NVARCHAR(50),
@Status NVARCHAR(50),
@ID_TestIntegracao INT OUTPUT
AS
UPDATE Teste_Integracao
   SET [ID_Membro] = @ID_Membro,
	   [ID_PBacklog] = @ID_Backlog,
	   [Data_Teste] = @Data,
	   [Erros] = @Erros,
	   [Relatorio_Log] = @Relatorio,
	   [Versao_Testada] = @Versao,
	   [Status] = @Status
	   
WHERE ID_TesteIntegracao=@ID_TestIntegracao

/****** DETALHES     ******/


GO
/****** Object:  StoredProcedure [dbo].[SP_TESTEUNIDADE_DELETE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TESTEUNIDADE_DELETE]
@ID_TestUnidade INT
AS
DELETE FROM Teste_Unidade WHERE ID_TestUnidade=@ID_TestUnidade



GO
/****** Object:  StoredProcedure [dbo].[SP_TESTEUNIDADE_INCLUIR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TESTEUNIDADE_INCLUIR]
@ID_Membro int,
@ID_Backlog int,
@Classe NVARCHAR(50),
@Status NVARCHAR(50),
@ID_TestUnidade INT OUTPUT
AS
INSERT INTO [dbo].[Teste_Unidade]
           ([ID_Membro],
		   [ID_Backlog],
		   [Classe],
		   [Status])
     VALUES
           (@ID_Membro,
		   @ID_Backlog,
		   @Classe,
		   @Status)



GO
/****** Object:  StoredProcedure [dbo].[SP_TESTEUNIDADE_UPDATE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_TESTEUNIDADE_UPDATE]
@ID_Membro int,
@ID_Backlog int,
@Classe NVARCHAR(50),
@Status NVARCHAR(50),
@ID_TestUnidade INT OUTPUT
AS
UPDATE Teste_Unidade
   SET [ID_Membro] = @ID_Membro,
	   [ID_Backlog] = @ID_Backlog,
	   [Classe] = @Classe,
	   [Status] = @Status
	   
WHERE ID_TestUnidade=@ID_TestUnidade

/****** DETALHES     ******/


GO
/****** Object:  StoredProcedure [dbo].[SP_USERS_BYID]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USERS_BYID]
@user nvarchar(50),
@pass nvarchar(50)
AS
SELECT * FROM Users
  where Email = @user and Senha = @pass


GO
/****** Object:  StoredProcedure [dbo].[SP_USERS_DELETE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USERS_DELETE]
@ID INT
AS
DELETE FROM Users WHERE ID_Equipe=@ID



GO
/****** Object:  StoredProcedure [dbo].[SP_USERS_DETALHES]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_USERS_DETALHES]
@ID INT
AS
SELECT [ID_Equipe]
      ,[Nome]
	  ,[Email]
	  ,[ID_Funcao]
  FROM Users
  where ID_Equipe = @ID

GO
/****** Object:  StoredProcedure [dbo].[SP_USERS_INCLUIR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_USERS_INCLUIR]
@Nome NVARCHAR(50),
@Email NVARCHAR(50),
@ID_Funcao int,
@ID INT OUTPUT
AS
INSERT INTO [dbo].[Users]
           ([Nome],
		   [Email],
		   [ID_Funcao])
     VALUES
           (@Nome,
		   @Email,
		   @ID_Funcao)



GO
/****** Object:  StoredProcedure [dbo].[SP_USERS_LISTAR]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_USERS_LISTAR]
AS
SELECT [ID_Equipe]
      ,[Nome]
	  ,[Email]
	  ,[ID_Funcao]
  FROM Users

/****** UPDATE    ******/

GO
/****** Object:  StoredProcedure [dbo].[SP_USERS_UPDATE]    Script Date: 29/11/2016 09:49:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_USERS_UPDATE]
@ID INT,
@Nome NVARCHAR(50),
@Email NVARCHAR(50),
@Funcao int

AS
UPDATE Users
   SET [Nome] = @Nome,
	   [ID_Funcao] = @Funcao,
	   [Email] = @Email
 WHERE ID_Equipe=@ID

/****** DETALHES     ******/


GO
USE [master]
GO
ALTER DATABASE [Scrumt] SET  READ_WRITE 
GO
