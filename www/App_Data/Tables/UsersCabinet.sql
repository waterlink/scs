USE [SCSDataBase]
GO
/****** Object:  Table [dbo].[UsersCabinet]    Script Date: 06/09/2008 12:57:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersCabinet]') AND type in (N'U'))
DROP TABLE [dbo].[UsersCabinet]
GO
/****** Object:  Table [dbo].[UsersCabinet]    Script Date: 06/09/2008 12:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersCabinet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[LastName] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[FathersName] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[ControlledPupilId] [int] NULL,
	[Login] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Telephone] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_UsersCabinet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF