USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[NewPupilOut]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NewPupilOut]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[NewPupilOut]
GO
/****** Object:  StoredProcedure [dbo].[NewPupilOut]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewPupilOut]
	
	(
		@pid int,
		@rs int,
		@ndt DateTime
	)
AS
begin
	SET NOCOUNT ON 
	insert into pupilsout(pupilid, data, reason) values(@pid, @ndt, @rs)
end

GO
GRANT EXECUTE ON [dbo].[NewPupilOut] TO [web]
GO


