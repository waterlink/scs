USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ShowPupilReportForDate]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShowPupilReportForDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShowPupilReportForDate]
GO
/****** Object:  StoredProcedure [dbo].[ShowPupilReportForDate]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowPupilReportForDate]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	(
	@pid int,
	@date datetime,
	@date2 datetime,
	@hour int, 
	@ndtoshow bit
	)
AS
begin
	SET NOCOUNT ON 
	if (@ndtoshow='false')
		update pupilsvalue set hour=@hour where (date=@date)and(pupilid=@pid)
	if (@ndtoshow='true')
		select id as Номер, subject as Предмет, hour as Час, vals as Оценки from pupilsvalue where (pupilid=@pid)and((date=@date)or(date=@date2))
end

GO
GRANT EXECUTE ON [dbo].[ShowPupilReportForDate] TO [web]
GO


