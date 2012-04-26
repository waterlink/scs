USE [SCSDataBase]
GO
/****** Object:  StoredProcedure [dbo].[NewCabinet]    Script Date: 06/09/2008 12:59:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NewCabinet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[NewCabinet]
GO
/****** Object:  StoredProcedure [dbo].[NewCabinet]    Script Date: 06/09/2008 12:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewCabinet]
	
	(
		@lg varchar(50)
	)
AS
begin
	SET NOCOUNT ON 
	insert into userscabinet(login) values(@lg)
end

GO
GRANT EXECUTE ON [dbo].[NewCabinet] TO [web]
GO


