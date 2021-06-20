USE [akekhoo]
GO
/****** Object:  Table [dbo].[RFM]    Script Date: 6/20/2021 10:38:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFM](
	[Recency_Rank] [int] NULL,
	[Recency_Value] [int] NULL,
	[Frequency_Rank] [int] NULL,
	[Frequency_Value] [int] NULL,
	[Monetary_Rank] [int] NULL,
	[Monetary_Value] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Segment]    Script Date: 6/20/2021 10:38:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Segment](
	[Segment] [varchar](50) NULL,
	[RFM] [int] NULL,
	[Description] [nvarchar](300) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[RFM] ([Recency_Rank], [Recency_Value], [Frequency_Rank], [Frequency_Value], [Monetary_Rank], [Monetary_Value]) VALUES (1, 300, 1, 1, 1, 800000)
INSERT [dbo].[RFM] ([Recency_Rank], [Recency_Value], [Frequency_Rank], [Frequency_Value], [Monetary_Rank], [Monetary_Value]) VALUES (2, 90, 2, 3, 2, 2000000)
INSERT [dbo].[RFM] ([Recency_Rank], [Recency_Value], [Frequency_Rank], [Frequency_Value], [Monetary_Rank], [Monetary_Value]) VALUES (3, 60, 3, 7, 3, 5000000)
INSERT [dbo].[RFM] ([Recency_Rank], [Recency_Value], [Frequency_Rank], [Frequency_Value], [Monetary_Rank], [Monetary_Value]) VALUES (4, 35, 4, 15, 4, 15000000)
INSERT [dbo].[RFM] ([Recency_Rank], [Recency_Value], [Frequency_Rank], [Frequency_Value], [Monetary_Rank], [Monetary_Value]) VALUES (5, 15, 5, 20, 5, 40000000)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Champions', 555, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Champions', 554, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Champions', 544, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Champions', 545, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Champions', 454, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Champions', 455, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Champions', 445, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Loyal', 543, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Loyal', 444, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Loyal', 435, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Loyal', 355, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Loyal', 354, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Loyal', 345, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Loyal', 344, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Loyal', 335, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 553, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 551, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 552, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 541, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 542, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 533, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 532, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 531, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 452, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 451, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 442, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 441, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 431, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 453, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 433, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 432, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 423, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 353, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 352, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 351, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 342, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 341, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 333, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Potential Loyalist', 323, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'New Customers', 512, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'New Customers', 511, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'New Customers', 422, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'New Customers', 421, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'New Customers', 412, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'New Customers', 411, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'New Customers', 311, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 525, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 524, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 523, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 522, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 521, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 515, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 514, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 513, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 425, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 424, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 413, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 414, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 415, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 315, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 314, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Promising', 313, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Need Attention', 535, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Need Attention', 534, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Need Attention', 443, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Need Attention', 434, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Need Attention', 343, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Need Attention', 334, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Need Attention', 325, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Need Attention', 324, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'About To Sleep', 331, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'About To Sleep', 321, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'About To Sleep', 312, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'About To Sleep', 221, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'About To Sleep', 213, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'About To Sleep', 231, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'About To Sleep', 241, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'About To Sleep', 251, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 255, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 254, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 245, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 244, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 253, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 252, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 243, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 242, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 235, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 234, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 225, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 224, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 153, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 152, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 145, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 143, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 142, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 135, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 134, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 133, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 125, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'At Risk', 124, NULL)
GO
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Cannot Lose Them', 155, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Cannot Lose Them', 154, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Cannot Lose Them', 144, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Cannot Lose Them', 214, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Cannot Lose Them', 215, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Cannot Lose Them', 115, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Cannot Lose Them', 114, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Cannot Lose Them', 113, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 332, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 322, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 231, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 241, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 251, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 233, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 232, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 223, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 222, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 132, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 123, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 122, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 212, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Hibernating customers', 211, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Lost customers', 111, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Lost customers', 112, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Lost customers', 121, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Lost customers', 131, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Lost customers', 141, NULL)
INSERT [dbo].[Segment] ([Segment], [RFM], [Description]) VALUES (N'Lost customers', 151, NULL)
