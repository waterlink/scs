USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 06/09/2008 13:09:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ChangePassword]
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 06/09/2008 13:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangePassword]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@Login varchar(50),
	@Password varchar(MAX)
AS
	/* SET NOCOUNT ON */
	set xact_abort on
	begin tran
		update Logins set Cripted = @Password where Login = @Login
	commit tran
	RETURN

GO
GRANT EXECUTE ON [dbo].[ChangePassword] TO [web]
GO
