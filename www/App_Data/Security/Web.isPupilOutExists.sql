USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[isPupilOutExists]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[isPupilOutExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[isPupilOutExists]
GO
/****** Object:  StoredProcedure [dbo].[isPupilOutExists]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[isPupilOutExists]
	
	(
		@pid int,
		@dt DateTime
	)
AS
begin
	SET NOCOUNT ON 
	select count(pupilid) as cnt from pupilsout where (pupilid=@pid) and (data=@dt)
end

GO
GRANT EXECUTE ON [dbo].[isPupilOutExists] TO [web]
GO


