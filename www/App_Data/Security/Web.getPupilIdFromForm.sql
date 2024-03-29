USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getPupilIdFromForm]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPupilIdFromForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getPupilIdFromForm]
GO
/****** Object:  StoredProcedure [dbo].[getPupilIdFromForm]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPupilIdFromForm]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
		@form varchar(10)
	)
	
AS
begin
	SET NOCOUNT ON 
	select id from pupils where form=@form
end

GO
GRANT EXECUTE ON [dbo].[getPupilIdFromForm] TO [web]
GO


