USE [FINALPROJECT]
GO
/****** Object:  User [test]    Script Date: 25/6/2024 10:30:43 μμ ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
/****** Object:  Table [dbo].[Evolutions]    Script Date: 25/6/2024 10:30:43 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evolutions](
	[ID] [int] NOT NULL,
	[pokemon_id] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Stage] [int] NOT NULL,
	[Image] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_pokemon_evolutions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 25/6/2024 10:30:43 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [int] NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Starters]    Script Date: 25/6/2024 10:30:43 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Starters](
	[ID] [int] NOT NULL,
	[identifier] [int] NOT NULL,
	[Stage] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Type] [varchar](20) NOT NULL,
	[Image] [varchar](100) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_pokemon_starters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (3, 0, N'Ivysaur', 1, N'images\ivysaur.png', N'A Grass-type Pokemon. The bud on its back absorbs sunlight, growing steadily as it prepares to bloom into a large flower. Tough and dependable, Ivysaur uses its plant-based abilities to assist in battles, proving itself a reliable partner.')
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (4, 0, N'Venusaur', 2, N'images\venusaur.png', N'A Grass-type Pokemon. Its massive flower blooms beautifully, releasing a soothing aroma that calms allies and intimidates foes. Strong and wise, Venusaur commands respect on the battlefield with its powerful plant-based attacks and tactical prowess.')
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (5, 1, N'Charmeleon', 1, N'images\charmeleon.png', N'A Fire-type Pokemon. Its fiery tail burns fiercely, flaring up in intensity when Charmeleon is excited or agitated. Spirited and valiant, it relentlessly pursues victory, using its sharp claws and fiery breath to overcome any challenge it faces.')
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (6, 1, N'Charizard', 2, N'images\charizard.png', N'A Fire-type Pokemon. Known for its majestic wings and fiery breath capable of melting almost anything. Majestic and fearsome, Charizard soars through the skies, unleashing intense flames and displaying unmatched aerial combat skills to dominate its opponents.')
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (7, 2, N'Wartortle', 1, N'images\wartortle.png', N'A Water-type Pokemon. Its tail is covered in rich, thick fur, which aids in swimming and balance. Strategic and resilient, Wartortle excels in water-based combat, using its tough shell for defense and powerful water attacks to outmaneuver and defeat adversaries.')
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (8, 2, N'Blastoise', 2, N'images\blastoise.png', N'A Water-type Pokemon. Equipped with powerful water cannons on its shell, capable of firing high-pressure blasts. Massive and formidable, Blastoise uses its immense strength and water power to dominate battles, proving itself an indomitable force on the battlefield.')
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (9, 0, N'Bulbasaur', 0, N'images\bulbasaur.png', N'A Grass-type Pokemon. It carries a plant bulb on its back, absorbing sunlight for energy and nutrients. Friendly and loyal, it often forms strong bonds with its trainer and fellow Pokemon.')
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (10, 1, N'Charmander', 0, N'images\charmander.png', N'A Fire-type Pokemon. It has a flame on its tail, which burns brighter and hotter depending on its health and emotions. Charmander is known for its bravery and energetic nature. ')
INSERT [dbo].[Evolutions] ([ID], [pokemon_id], [Name], [Stage], [Image], [Description]) VALUES (11, 2, N'Squirtle', 0, N'images\squirtle.png', N'A Water-type Pokemon. Its hard shell offers protection and aids in swimming, allowing it to move swiftly in water. Squirtle is playful yet determined, often using its water-spraying abilities to defend itself and its companions.')
GO
INSERT [dbo].[Login] ([ID], [username], [password]) VALUES (1, N'panagiotis', N'2024!')
GO
INSERT [dbo].[Starters] ([ID], [identifier], [Stage], [Name], [Type], [Image], [Description]) VALUES (0, 0, 0, N'Bulbasaur', N'Grass', N'images\bulbasaur.png', N'A Grass-type Pokemon. It carries a plant bulb on its back, absorbing sunlight for energy and nutrients. Friendly and loyal, it often forms strong bonds with its trainer and fellow Pokemon.')
INSERT [dbo].[Starters] ([ID], [identifier], [Stage], [Name], [Type], [Image], [Description]) VALUES (1, 1, 0, N'Charmander', N'Fire', N'images\charmander.png', N'A Fire-type Pokemon. It has a flame on its tail, which burns brighter and hotter depending on its health and emotions. Charmander is known for its bravery and energetic nature. ')
INSERT [dbo].[Starters] ([ID], [identifier], [Stage], [Name], [Type], [Image], [Description]) VALUES (2, 2, 0, N'Squirtle', N'Water', N'images\squirtle.png', N'A Water-type Pokemon. Its hard shell offers protection and aids in swimming, allowing it to move swiftly in water. Squirtle is playful yet determined, often using its water-spraying abilities to defend itself and its companions.')
GO
