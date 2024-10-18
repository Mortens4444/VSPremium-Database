USE [VSPremium]
GO

/****** Object:  Table [dbo].[AudioAlarmSettings]    Script Date: 10/04/2011 13:47:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AudioAlarmSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [bigint] NULL,
	[camera_id] [bigint] NULL,
	[event_type_id] [bigint] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_AudioAlarmSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_Cameras] FOREIGN KEY([camera_id])
REFERENCES [dbo].[Cameras] ([ID])
GO

ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_Cameras]
GO

ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_EventTypes] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[EventTypes] ([ID])
GO

ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_EventTypes]
GO

ALTER TABLE [dbo].[AudioAlarmSettings]  WITH CHECK ADD  CONSTRAINT [FK_AudioAlarmSettings_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[AudioAlarmSettings] CHECK CONSTRAINT [FK_AudioAlarmSettings_Servers]
GO

