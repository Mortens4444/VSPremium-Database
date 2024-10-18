USE [VSPremium]
GO

/****** Object:  Table [dbo].[RaidEnclosures]    Script Date: 05/30/2012 09:12:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RaidEnclosures](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [bigint] NOT NULL,
	[enclosure_type] [tinyint] NOT NULL,
	[location_x] [int] NOT NULL,
	[location_y] [int] NOT NULL,
	[width] [int] NOT NULL,
	[height] [int] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_RaidEnclosures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RaidEnclosures]  WITH CHECK ADD  CONSTRAINT [FK_RaidEnclosures_Servers1] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[RaidEnclosures] CHECK CONSTRAINT [FK_RaidEnclosures_Servers1]
GO

