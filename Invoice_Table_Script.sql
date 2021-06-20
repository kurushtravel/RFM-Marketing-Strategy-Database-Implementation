USE [akekhoo]
GO

/****** Object:  Table [dbo].[Invoice]    Script Date: 6/19/2021 10:55:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Invoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Payable] [int] NULL,
	[Date] [int] NULL,
	[Status] [varchar](50) NULL,
	[Comment] [nvarchar](1024) NULL,
	[ProductionComment] [nvarchar](1024) NULL,
	[Printed] [bit] NULL,
	[ProductionPrinted] [bit] NULL,
	[DeliveryTime] [char](5) NULL,
	[AddressId] [int] NULL,
	[CreateTime] [bigint] NULL,
	[CreatorUsername] [varchar](50) NULL,
	[Biker] [nvarchar](50) NULL,
	[BankAccount] [nvarchar](255) NULL,
	[IsGift] [bit] NULL,
	[CongratulationsMessage] [nvarchar](256) NULL,
	[Address] [nvarchar](255) NULL,
	[Discount] [int] NULL,
	[Price] [int] NULL,
	[DeliveryPayment] [int] NULL,
	[OldFacturId] [int] NULL,
	[PaymentId] [nvarchar](32) NULL,
	[Tax] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF__Invoice__Printed__6E01572D]  DEFAULT ((0)) FOR [Printed]
GO

ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF__Invoice__Product__6EF57B66]  DEFAULT ((0)) FOR [ProductionPrinted]
GO

