USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getAllPupilsFLF]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllPupilsFLF]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllPupilsFLF]
GO
/****** Object:  StoredProcedure [dbo].[getAllPupilsFLF]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllPupilsFLF]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
begin
	SET NOCOUNT ON 
	select flf from pupils	
end

GO
GRANT EXECUTE ON [dbo].[getAllPupilsFLF] TO [web]
GO


