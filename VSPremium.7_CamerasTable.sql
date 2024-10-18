USE [VSPremium]
GO

/****** Object:  Table [dbo].[Cameras]    Script Date: 10/04/2011 13:45:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cameras](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[server_id] [bigint] NULL,
	[recorder_index] [bigint] NULL,
	[camera_name] [nvarchar](50) NULL,
	[camera_guid] [nvarchar](50) NULL,
	[rvs_user_name] [nvarchar](50) NULL,
	[rvs_password] [nvarchar](200) NULL,
	[x] [int] NULL,
	[y] [int] NULL,
	[width] [int] NULL,
	[height] [int] NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_Cameras] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Cameras]  WITH CHECK ADD  CONSTRAINT [FK_Cameras_Servers] FOREIGN KEY([server_id])
REFERENCES [dbo].[Servers] ([ID])
GO

ALTER TABLE [dbo].[Cameras] CHECK CONSTRAINT [FK_Cameras_Servers]
GO

