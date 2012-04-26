USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[isCabinetExists]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[isCabinetExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[isCabinetExists]
GO
/****** Object:  StoredProcedure [dbo].[isCabinetExists]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[isCabinetExists]
	
	(
		@lg varchar(50)
	)
AS
begin
	SET NOCOUNT ON 
	select count(id) from userscabinet where (login=@lg)
end

GO
GRANT EXECUTE ON [dbo].[isCabinetExists] TO [web]
GO


