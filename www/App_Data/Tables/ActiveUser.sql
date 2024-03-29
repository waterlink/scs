USE [SCSDataBase]
GO
/****** Object:  Table [dbo].[ActiveUser]    Script Date: 06/09/2008 12:56:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActiveUser]') AND type in (N'U'))
DROP TABLE [dbo].[ActiveUser]
GO
/****** Object:  Table [dbo].[ActiveUser]    Script Date: 06/09/2008 12:56:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActiveUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginTo] [nchar](10) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[LoginFrom] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Message] [varchar](max) COLLATE Cyrillic_General_CI_AS NULL,
	[Readed] [bit] NOT NULL,
	[StateString] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_ActiveUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF