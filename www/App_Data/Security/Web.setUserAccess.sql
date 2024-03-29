USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[setUserAccess]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[setUserAccess]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[setUserAccess]
GO
/****** Object:  StoredProcedure [dbo].[setUserAccess]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setUserAccess]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
	@lg varchar(50),
	@ac int
	)
	
AS
begin
	SET NOCOUNT ON 
	declare @@acold int
	set @@acold = (select min(access) as ac from logins where login=@lg)
	if (@ac <= @@acold)
		update logins set access=@ac where login=@lg
end

GO
GRANT EXECUTE ON [dbo].[setUserAccess] TO [web]
GO


