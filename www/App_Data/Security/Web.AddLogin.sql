USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[AddLogin]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddLogin]
GO
/****** Object:  StoredProcedure [dbo].[AddLogin]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLogin]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
	@Login varchar(50),
	@Password varchar(MAX),
	@Access int
	)
AS
	SET NOCOUNT ON 
	set xact_abort on
	begin tran
		insert into Logins(Login, Cripted, Access) values(@Login, @Password, @Access)
	commit tran
	RETURN

GO
GRANT EXECUTE ON [dbo].[AddLogin] TO [web]
GO


