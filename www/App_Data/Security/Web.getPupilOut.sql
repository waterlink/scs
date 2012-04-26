USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getPupilOut]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPupilOut]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getPupilOut]
GO
/****** Object:  StoredProcedure [dbo].[getPupilOut]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPupilOut]
	
	(
		@pid int
	)
AS
begin
	SET NOCOUNT ON 
	select data, reason from pupilsout where pupilid=@pid
end

GO
GRANT EXECUTE ON [dbo].[getPupilOut] TO [web]
GO


