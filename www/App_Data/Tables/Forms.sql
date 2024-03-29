USE [SCSDataBase]
GO
/****** Object:  Table [dbo].[Forms]    Script Date: 06/12/2008 13:32:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Forms]') AND type in (N'U'))
DROP TABLE [dbo].[Forms]
GO
/****** Object:  Table [dbo].[Forms]    Script Date: 06/12/2008 13:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Forms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Form] [varchar](10) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Forms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF