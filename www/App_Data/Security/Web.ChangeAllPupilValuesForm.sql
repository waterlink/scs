USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ChangeAllPupilValuesForm]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeAllPupilValuesForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ChangeAllPupilValuesForm]
GO
/****** Object:  StoredProcedure [dbo].[ChangeAllPupilValuesForm]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeAllPupilValuesForm]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
	@subj varchar(50),
	@dt datetime,
	@pid int
	)
AS
begin
	SET NOCOUNT ON 
	if not exists (select * from pupilsvalue where 
							(pupilid=@pid)and
							(subject=@subj)and
							(date=@dt))
		insert into pupilsvalue(pupilid, subject, date) values(@pid, @subj, @dt)
end

GO
GRANT EXECUTE ON [dbo].[ChangeAllPupilValuesForm] TO [web]
GO


