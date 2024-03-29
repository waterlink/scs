USE [SCSDataBase]
GO
/****** Object:  Table [dbo].[PupilsOut]    Script Date: 06/09/2008 12:58:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PupilsOut]') AND type in (N'U'))
DROP TABLE [dbo].[PupilsOut]
GO
/****** Object:  Table [dbo].[PupilsOut]    Script Date: 06/09/2008 15:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PupilsOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PupilId] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Reason] [int] NOT NULL,
	[ExtendedReason] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_PupilsOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
