USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getPupilFLFFromCabinet]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPupilFLFFromCabinet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getPupilFLFFromCabinet]
GO
/****** Object:  StoredProcedure [dbo].[getPupilFLFFromCabinet]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPupilFLFFromCabinet]
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
	declare @@pid int
	set @@pid = (select controlledpupilid from userscabinet where (login=@lg))
	select flf from pupils where id=@@pid
end

GO
GRANT EXECUTE ON [dbo].[getPupilFLFFromCabinet] TO [web]
GO


