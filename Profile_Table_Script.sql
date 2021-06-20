USE [akekhoo]
GO

/****** Object:  Table [dbo].[Profile]    Script Date: 6/19/2021 10:56:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Profile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surename] [nvarchar](255) NULL,
	[Referrer] [nvarchar](255) NULL,
	[Sex] [nvarchar](25) NULL,
	[Birthdate] [nvarchar](255) NULL,
	[NationalCode] [nvarchar](255) NULL,
	[IdNo] [nvarchar](255) NULL,
	[Education] [nvarchar](255) NULL,
	[Job] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Mobile] [nvarchar](255) NULL,
	[HomeTel] [nvarchar](255) NULL,
	[WorkTel] [nvarchar](255) NULL,
	[MainContact] [nvarchar](255) NULL,
	[ContactTime] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[UserId] [int] NULL,
	[AllowEmail] [bit] NULL,
	[ExcludeOccasionHoliday] [bit] NULL,
	[Hold] [bit] NOT NULL,
	[SalesPersonId] [uniqueidentifier] NULL,
	[ProductionUnitId] [int] NOT NULL,
	[ClubLevel] [int] NULL,
	[ReferrerId] [int] NULL,
	[Code] [varchar](50) NULL,
	[AffiliateId] [int] NOT NULL,
	[MethodOfIntroduction] [nvarchar](128) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF_Profile_Hold]  DEFAULT ((0)) FOR [Hold]
GO

ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF_Profile_AffiliateId]  DEFAULT ((1)) FOR [AffiliateId]
GO

