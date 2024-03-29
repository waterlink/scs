USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ShowFormReport]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShowFormReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShowFormReport]
GO
/****** Object:  StoredProcedure [dbo].[ShowFormReport]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowFormReport]
	
	(
		@dtst datetime,
		@dten datetime,
		@lg varchar(50)
	)
AS
begin
-- exec showformreport developer
	SET NOCOUNT ON 
	declare @pid int, @Vals varchar(max), @lastId int
	set @pid = (select controlledpupilid from userscabinet where login=@lg)
	declare @form varchar(10)
	set @form = (select form from pupils where id=@pid)

	select pupilid, subject, vals
	into #vals
	from pupilsvalue where exists(select * from pupils where id=pupilsvalue.pupilid)
						and date >= @dtst and date <= @dten
			order by pupilid, subject

	select distinct p.flf, v.pupilid, v.subject, identity(int, 1, 1) as Id
	into #obj
	from #vals as v
	join pupils as p on v.pupilid=p.id
	

	select @lastId = 1

	create table #rpt(flf varchar(50) null, pupilid int, Subject varchar(50) null, Id int, Vals varchar(max))

	while @lastId is not null
	begin
		set @Vals = ''
		select @Vals = @Vals + case @Vals when '' then '' else ', ' end + v.vals
		from #vals as v
		join #obj as o on v.subject = o.subject
		where o.Id = @lastId and o.pupilid=v.pupilid and v.vals is not null
		group by v.vals

		insert #rpt
		select *, @Vals
		from #obj
		where Id = @lastId 

		select @lastId = min(Id) from #obj where Id > @lastId
	end

	select flf as ФИО, subject as Предмет, vals as Оценки
	from #rpt
	order by pupilid, Subject

	drop table #vals
	drop table #obj
	drop table #rpt
end

GO
GRANT EXECUTE ON [dbo].[ShowFormReport] TO [web]
GO


