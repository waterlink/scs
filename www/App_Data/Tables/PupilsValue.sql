USE [SCSDataBase]
GO
/****** Object:  Table [dbo].[PupilsValue]    Script Date: 06/09/2008 12:58:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PupilsValue]') AND type in (N'U'))
DROP TABLE [dbo].[PupilsValue]
GO
/****** Object:  Table [dbo].[PupilsValue]    Script Date: 06/11/2008 12:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PupilsValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PupilId] [int] NOT NULL,
	[Vals] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Subject] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Date] [datetime] NULL,
	[Hour] [int] NULL,
 CONSTRAINT [PK_PupilsValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF