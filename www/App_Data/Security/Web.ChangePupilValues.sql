USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ChangePupilValues]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangePupilValues]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ChangePupilValues]
GO
/****** Object:  StoredProcedure [dbo].[ChangePupilValues]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangePupilValues]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
	@id int,
	@subj varchar(50),
	@vals varchar(50),
	@dt datetime,
	@pid int
	)
AS
begin
	SET NOCOUNT ON 
	if (@id=-1)
		insert into pupilsvalue(pupilid, subject, vals, date) values(@pid, @subj, @vals, @dt)
	else
		update pupilsvalue set subject=@subj, vals=@vals, date=@dt where (id=@id)
end

GO
GRANT EXECUTE ON [dbo].[ChangePupilValues] TO [web]
GO


