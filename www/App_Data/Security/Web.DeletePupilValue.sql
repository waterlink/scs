USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[DeletePupilValue]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletePupilValue]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeletePupilValue]
GO
/****** Object:  StoredProcedure [dbo].[DeletePupilValue]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePupilValue]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
	@id int
	)
AS
begin
	SET NOCOUNT ON 
	delete pupilsvalue where id=@id
end

GO
GRANT EXECUTE ON [dbo].[DeletePupilValue] TO [web]
GO


