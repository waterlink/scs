USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[Default]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Default]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Default]
GO
/****** Object:  StoredProcedure [dbo].[Default]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Default]
	
	(
	
	)
AS
begin
	SET NOCOUNT ON 
	
end

GO
GRANT EXECUTE ON [dbo].[Default] TO [web]
GO


