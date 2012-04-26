USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getUsersTelephone]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getUsersTelephone]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getUsersTelephone]
GO
/****** Object:  StoredProcedure [dbo].[getUsersTelephone]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUsersTelephone]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
		@lg varchar(50)
	)
	
AS
begin
	SET NOCOUNT ON 
	select telephone from userscabinet where (login=@lg)
end

GO
GRANT EXECUTE ON [dbo].[getUsersTelephone] TO [web]
GO


