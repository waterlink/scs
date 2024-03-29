USE [SCSDataBase]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 06/09/2008 12:51:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logins]') AND type in (N'U'))
DROP TABLE [dbo].[Logins]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 06/09/2008 12:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Cripted] [varchar](max) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Access] [int] NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO
insert into Logins(Login, Cripted, Access) values('developer', '1122_1139_1156_1751_2091_2210_1122_1139_1156', 4)
