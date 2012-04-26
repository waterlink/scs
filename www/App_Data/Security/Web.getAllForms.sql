USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getAllForms]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllForms]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllForms]
GO
/****** Object:  StoredProcedure [dbo].[getAllForms]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllForms]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	
AS
begin
	SET NOCOUNT ON 
	select form from forms
end

GO
GRANT EXECUTE ON [dbo].[getAllForms] TO [web]
GO


