USE [VSPremium]
GO

/****** Object:  Table [dbo].[Permissions]    Script Date: 10/04/2011 13:49:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Permissions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([ID])
GO

ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Groups]
GO

ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Operations] FOREIGN KEY([operation_id])
REFERENCES [dbo].[Operations] ([ID])
GO

ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Operations]
GO

