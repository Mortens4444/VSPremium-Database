USE [VSPremium]
GO

/****** Object:  Table [dbo].[UsersInGroups]    Script Date: 10/04/2011 13:51:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UsersInGroups](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
	[chk] [bigint] NOT NULL,
 CONSTRAINT [PK_UsersInGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UsersInGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersInGroups_Groups] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([ID])
GO

ALTER TABLE [dbo].[UsersInGroups] CHECK CONSTRAINT [FK_UsersInGroups_Groups]
GO

ALTER TABLE [dbo].[UsersInGroups]  WITH CHECK ADD  CONSTRAINT [FK_UsersInGroups_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[UsersInGroups] CHECK CONSTRAINT [FK_UsersInGroups_Users]
GO

