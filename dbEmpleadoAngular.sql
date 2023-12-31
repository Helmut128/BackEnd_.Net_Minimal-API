USE [master]
GO
	/****** Object:  Database [DBEmpleado]    Script Date: 18/7/2023 14:25:23 ******/
	CREATE DATABASE [DBEmpleado]
GO USE [DBEmpleado]
GO
	/****** Object:  Table [dbo].[Departamento]    Script Date: 18/7/2023 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[Departamento](
		[IdDepartamento] [int] IDENTITY(1, 1) NOT NULL,
		[Nombre] [varchar](50) NULL,
		[FechaCreacion] [datetime] NULL,
		PRIMARY KEY CLUSTERED ([IdDepartamento] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON,
			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
	/****** Object:  Table [dbo].[Empleado]    Script Date: 18/7/2023 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO CREATE TABLE [dbo].[Empleado](
		[IdEmpleado] [int] IDENTITY(1, 1) NOT NULL,
		[NombreCompleto] [varchar](50) NULL,
		[IdDepartamento] [int] NULL,
		[Sueldo] [int] NULL,
		[FechaContrato] [datetime] NULL,
		[FechaCreacion] [datetime] NULL,
		PRIMARY KEY CLUSTERED ([IdEmpleado] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON,
			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
		) ON [PRIMARY]
	) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departamento]
ADD DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Empleado]
ADD DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Empleado] WITH CHECK
ADD CONSTRAINT [FK_Empleado_Departamento] FOREIGN KEY([IdDepartamento]) REFERENCES [dbo].[Departamento] ([IdDepartamento])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Departamento]
GO USE [master]
GO ALTER DATABASE [DBEmpleado]
SET READ_WRITE
GO