USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ShowFormReportOut]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShowFormReportOut]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShowFormReportOut]
GO
/****** Object:  StoredProcedure [dbo].[ShowFormReportOut]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowFormReportOut]
	
	(
		@dtst datetime,
		@dten datetime,
		@lg varchar(50)
	)
AS
begin
-- exec ShowFormReportOut developer
	SET NOCOUNT ON 
	declare @pid int, @Vals varchar(max), @lastId int
	set @pid = (select controlledpupilid from userscabinet where login=@lg)
	declare @form varchar(10)
	set @form = (select form from pupils where id=@pid)
	
	create table #reas1(flf varchar(50), ho int null)
	create table #reas2(flf varchar(50), ho int null)
	create table #reas3(flf varchar(50), ho int null)

	insert #reas1
	select pp.flf as flf, isnull(sum(datepart(hour, po.data)), 0) as ho
	from pupilsout as po
	join pupils as pp on po.pupilid=pp.id
	where reason=1 and po.data >= @dtst and po.data <= @dten
	group by pp.flf

	insert #reas2
	select pp.flf as flf, isnull(sum(datepart(hour, po.data)), 0) as ho
	from pupilsout as po
	join pupils as pp on po.pupilid=pp.id
	where reason=2 and po.data >= @dtst and po.data <= @dten
	group by pp.flf

	insert #reas3
	select pp.flf as flf, isnull(sum(datepart(hour, po.data)), 0) as ho
	from pupilsout as po
	join pupils as pp on po.pupilid=pp.id
	where reason=3 and po.data >= @dtst and po.data <= @dten
	group by pp.flf

	select p.flf as [flf], isnull(r1.ho, 0) as [uu], isnull(r2.ho, 0) as [bb], isnull(r3.ho, 0) as [pp]
	into #out
	from pupils as p
	left join #reas1 as r1 on p.flf=r1.flf
	left join #reas2 as r2 on p.flf=r2.flf 
	left join #reas3 as r3 on p.flf=r3.flf
	where p.form = @form
	
	declare @uu int, @bb int, @pp int
	set @uu = (select sum(uu) from #out)
	set @bb = (select sum(bb) from #out)
	set @pp = (select sum(pp) from #out)

	insert into #out(flf, uu, bb, pp) values('Всего', @uu, @bb, @pp)

	--select * from #reas1
	--select * from #reas2
	--select * from #reas3
	
	select flf as ФИО, uu as У, bb as Б, pp as П from #out

	drop table #reas1
	drop table #reas2
	drop table #reas3
	drop table #out
end

GO
GRANT EXECUTE ON [dbo].[ShowFormReportOut] TO [web]
GO


