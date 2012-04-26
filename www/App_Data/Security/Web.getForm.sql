USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getForm]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getForm]
GO
/****** Object:  StoredProcedure [dbo].[getForm]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getForm]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
		@pid int
	)
	
AS
begin
	SET NOCOUNT ON 
	select form from pupils where id=@pid
end

GO
GRANT EXECUTE ON [dbo].[getForm] TO [web]
GO


