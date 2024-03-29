USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[setPupilOut]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[setPupilOut]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[setPupilOut]
GO
/****** Object:  StoredProcedure [dbo].[setPupilOut]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setPupilOut]
	
	(
		@pid int,
		@dt DateTime,
		@rs int,
		@ndt DateTime
	)
AS
begin
	SET NOCOUNT ON 
	update pupilsout set data=@ndt, reason=@rs where (pupilid=@pid) and (data=@dt)
end

GO
GRANT EXECUTE ON [dbo].[setPupilOut] TO [web]
GO


