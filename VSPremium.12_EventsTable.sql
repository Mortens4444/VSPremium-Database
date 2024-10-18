USE [VSPremium]
GO

/****** Object:  Table [dbo].[Events]    Script Date: 10/04/2011 13:48:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Events](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[computer_device_id] [bigint] NULL,
	[camera_device_id] [bigint] NULL,
	[event_type_id] [bigint] NOT NULL,
	[event_time] [datetimeoffset](7) NOT NULL,
	[other_information] [nvarchar](max) NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Cameras] FOREIGN KEY([camera_device_id])
REFERENCES [dbo].[Cameras] ([ID])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Cameras]
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventTypes] FOREIGN KEY([event_type_id])
REFERENCES [dbo].[EventTypes] ([ID])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventTypes]
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Servers] FOREIGN KEY([computer_device_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Servers]
GO

