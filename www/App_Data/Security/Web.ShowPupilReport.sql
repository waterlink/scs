USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[ShowPupilReport]    Script Date: 06/09/2008 14:52:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShowPupilReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShowPupilReport]
GO
/****** Object:  StoredProcedure [dbo].[ShowPupilReport]    Script Date: 06/09/2008 14:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ShowPupilReport]
	-- Add the parameters for the stored procedure here
	@p1 varchar(50)	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select id as Номер, subject as Предмет, vals as Оценки from pupilsvalue where pupilid=@p1
	update pupilsout set extendedreason='У' where (pupilid=@p1)and(reason=1)
	update pupilsout set extendedreason='Б' where (pupilid=@p1)and(reason=2)
	update pupilsout set extendedreason='П' where (pupilid=@p1)and(reason=3)
	select data as 'Дата, длительность', extendedreason as Причина from pupilsout where pupilid=@p1
END

GO
GRANT EXECUTE ON [dbo].[ShowPupilReport] TO [web]
GO
