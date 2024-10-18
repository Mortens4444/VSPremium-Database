USE [VSPremium]
GO

/****** Object:  Table [dbo].[EventTypeSettings]    Script Date: 10/04/2011 13:48:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EventTypeSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [bigint] NULL,
	[camera_id] [bigint] NULL,
	[event_type_id] [bigint] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_EventTypeSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Cameras] FOREIGN KEY([camera_id])
REFERENCES [dbo].[Cameras] ([ID])
GO

ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Cameras]
GO

ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Events] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[Events] ([ID])
GO

ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Events]
GO

ALTER TABLE [dbo].[EventTypeSettings]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeSettings_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[EventTypeSettings] CHECK CONSTRAINT [FK_EventTypeSettings_Servers]
GO

