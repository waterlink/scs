USE [SCSDataBase]
GO
/****** Object:  Table [dbo].[Pupils]    Script Date: 06/09/2008 12:57:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pupils]') AND type in (N'U'))
DROP TABLE [dbo].[Pupils]
GO
/****** Object:  Table [dbo].[Pupils]    Script Date: 06/12/2008 13:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pupils](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FLF] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Form] [varchar](10) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Pupils] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF