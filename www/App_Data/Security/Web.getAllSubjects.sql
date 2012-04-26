USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[getAllSubjects]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllSubjects]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllSubjects]
GO
/****** Object:  StoredProcedure [dbo].[getAllSubjects]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllSubjects]
	

AS
begin
	SET NOCOUNT ON 
	select subject from subjects
end

GO
GRANT EXECUTE ON [dbo].[getAllSubjects] TO [web]
GO


