USE [master]
GO
/****** Object:  Database [FastTravel]    Script Date: 5/12/2022 17:01:46 ******/
CREATE DATABASE [FastTravel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FastTravel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FastTravel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FastTravel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FastTravel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FastTravel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FastTravel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FastTravel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FastTravel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FastTravel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FastTravel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FastTravel] SET ARITHABORT OFF 
GO
ALTER DATABASE [FastTravel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FastTravel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FastTravel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FastTravel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FastTravel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FastTravel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FastTravel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FastTravel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FastTravel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FastTravel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FastTravel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FastTravel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FastTravel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FastTravel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FastTravel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FastTravel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FastTravel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FastTravel] SET RECOVERY FULL 
GO
ALTER DATABASE [FastTravel] SET  MULTI_USER 
GO
ALTER DATABASE [FastTravel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FastTravel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FastTravel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FastTravel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FastTravel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FastTravel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FastTravel', N'ON'
GO
ALTER DATABASE [FastTravel] SET QUERY_STORE = OFF
GO
USE [FastTravel]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[idAlumno] [int] IDENTITY(2001,1) NOT NULL,
	[idOrganizacion] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[nCuenta] [bigint] NULL,
	[email] [nvarchar](50) NULL,
	[fallos] [int] NULL,
	[saldo] [money] NULL,
	[ubicacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autobuses]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autobuses](
	[idAutobus] [int] IDENTITY(5001,1) NOT NULL,
	[idOrganizacion] [int] NULL,
	[placa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Autobuses] PRIMARY KEY CLUSTERED 
(
	[idAutobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clases]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clases](
	[idClase] [int] IDENTITY(1001,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[horaInicio] [int] NULL,
	[horaFinal] [int] NULL,
 CONSTRAINT [PK_Clases] PRIMARY KEY CLUSTERED 
(
	[idClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conductores]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductores](
	[idConductor] [int] IDENTITY(8001,1) NOT NULL,
	[idAutobus] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
 CONSTRAINT [PK_Conductores] PRIMARY KEY CLUSTERED 
(
	[idConductor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[idMatricula] [int] IDENTITY(1000,1) NOT NULL,
	[idAlumno] [int] NULL,
	[idClase] [int] NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[idMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizaciones]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizaciones](
	[idOrganizacion] [int] IDENTITY(1001,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[direccion] [nvarchar](50) NULL,
	[tipo] [nvarchar](50) NULL,
	[idUsuario] [int] NULL,
	[contrasenia] [nvarchar](50) NULL,
	[logotipo] [nvarchar](100) NULL,
	[pColores] [nvarchar](50) NULL,
 CONSTRAINT [PK_Organizaciones] PRIMARY KEY CLUSTERED 
(
	[idOrganizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puntos]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntos](
	[idPunto] [int] IDENTITY(7001,1) NOT NULL,
	[idRuta] [int] NULL,
	[valor] [int] NULL,
	[sector] [nvarchar](50) NULL,
	[nombre] [nvarchar](50) NULL,
	[final] [bit] NULL,
 CONSTRAINT [PK_Puntos] PRIMARY KEY CLUSTERED 
(
	[idPunto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recorridos]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recorridos](
	[idRecorrido] [int] IDENTITY(4001,1) NOT NULL,
	[idRuta] [int] NULL,
	[idAutobus] [int] NULL,
	[horaSalida] [int] NULL,
	[horaEntrada] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Recorridos] PRIMARY KEY CLUSTERED 
(
	[idRecorrido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registros]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registros](
	[idRegistro] [int] IDENTITY(6001,1) NOT NULL,
	[idAlumno] [int] NULL,
	[idRecorrido] [int] NULL,
	[horaIngreso] [datetime] NULL,
	[horaSalida] [datetime] NULL,
 CONSTRAINT [PK_Registros] PRIMARY KEY CLUSTERED 
(
	[idRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[idRuta] [int] IDENTITY(3001,1) NOT NULL,
	[idOrganizacion] [int] NULL,
	[nombreRuta] [nvarchar](50) NULL,
	[precio] [money] NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[idRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RutasAlumnos]    Script Date: 5/12/2022 17:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutasAlumnos](
	[idRutaAlumno] [int] IDENTITY(9001,1) NOT NULL,
	[idAlumno] [int] NULL,
	[rutaFijada] [bit] NULL,
	[destino] [nvarchar](50) NULL,
 CONSTRAINT [PK_RutasAlumnos] PRIMARY KEY CLUSTERED 
(
	[idRutaAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2001, 1001, N'Ariel', N'Gomez', 20151902188, N'arielgmez@unah.hn', 0, 10.0000, N'Hato')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2002, 1001, N'Pedro', N'Ramirez', 20161901288, N'pedroramires@unah.hn', 2, 0.0000, N'Centro')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2003, 1001, N'Jose', N'Martines', 20151900001, N'josemartines@unah.hn', 0, 30.0000, N'Carrizal')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2004, 1001, N'Marta', N'Ramirez', 20011802111, N'martaramirez@unah.hn', 1, 40.0000, N'Kennedy')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2005, 1001, N'Fernando', N'Ramos', 20181000293, N'fernandoramos@unah.hn', 4, 13.0000, N'Loarque')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2006, 1001, N'Luis', N'Pineda', 20201209234, N'luispineda@unah.hn', 1, 14.0000, N'Res La Vega')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2007, 1001, N'Jose', N'Cruz', 20191928374, N'josecruz@unah.hn', 0, 40.0000, N'Res La Plaza')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2008, 1001, N'Marcos', N'Reyes', 20178347926, N'marcosreyes@unah.hn', 4, 50.0000, N'San Pablo')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2009, 1001, N'Alejandro', N'Romero', 20161840254, N'alejandroromero@unah.hn', 1, 130.0000, N'Hato')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2010, 1001, N'Santos', N'Castro', 20141978652, N'santoscastro@unah.hn', 4, 150.0000, N'Centro')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2011, 1001, N'Julio', N'Pineda', 20192389457, N'juliopineda@unah.hn', 5, 34.0000, N'Carrizal')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2012, 1001, N'Marcos', N'Avila', 20091938564, N'marcosavila@unah.hn', 4, 35.0000, N'Kennedy')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2013, 1001, N'Oliver', N'Velasquez', 20142948789, N'olivervelasquez@unah.hn', 9, 67.0000, N'Loarque')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2014, 1001, N'Karen', N'Reyes', 20084651298, N'karenreyes@unah.hn', 0, 59.0000, N'Res La Vega')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2015, 1001, N'Irma', N'Avila', 20095489761, N'irmaavila@unah.hn', 0, 34.0000, N'Res La Plaza')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2016, 1001, N'Dilcia', N'Orellana', 20192938475, N'dilciaorellana@unah.hn', 0, 23.0000, N'San Pablo')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2017, 1001, N'Reina', N'Reyes', 20131928354, N'reinareyes@unah.hn', 1, 23.0000, N'Hato')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2018, 1001, N'Andrew', N'Ortiz', 20031234234, N'correoprueba@unah.hn', 2, 23.0000, N'Centro')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2019, 1001, N'Olga', N'Herrera', 20192938475, N'correoprueba@unah.hn', 3, 54.0000, N'Carrizal')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2020, 1001, N'Marel', N'Maradiaga', 20192938474, N'correoprueba@unah.hn', 4, 65.0000, N'Kennedy')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2021, 1001, N'Osmin', N'Barahona', 20192938473, N'correoprueba@unah.hn', 2, 23.0000, N'Loarque')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2022, 1001, N'Reina', N'Dominguez', 20192938472, N'correoprueba@unah.hn', 1, 43.0000, N'Res La Vega')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2023, 1001, N'Arlin', N'Castellanos', 20192938471, N'correoprueba@unah.hn', 2, 34.0000, N'Res La Plaza')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2024, 1001, N'Nery', N'Escobar', 20192938434, N'correoprueba@unah.hn', 2, 34.0000, N'San Pablo')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2025, 1001, N'Jayden', N'Ponce', 20192938465, N'correoprueba@unah.hn', 1, 76.0000, N'Hato')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2026, 1001, N'Kelvin', N'Fuentes', 20192938476, N'correoprueba@unah.hn', 4, 13.0000, N'Centro')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2027, 1001, N'Tabora', N'Matute', 20192938235, N'correoprueba@unah.hn', 5, 12.0000, N'Carrizal')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2028, 1001, N'Paul', N'Caceres', 20192338496, N'correoprueba@unah.hn', 9, 54.0000, N'Kennedy')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2029, 1001, N'Henry', N'Figueroa', 20192958983, N'correoprueba@unah.hn', 2, 65.0000, N'Loarque')
INSERT [dbo].[Alumnos] ([idAlumno], [idOrganizacion], [nombre], [apellido], [nCuenta], [email], [fallos], [saldo], [ubicacion]) VALUES (2030, 1001, N'Madian', N'Mendez', 20192938888, N'correoprueba@unah.hn', 12, 56.0000, N'Kennedy')
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
GO
SET IDENTITY_INSERT [dbo].[Autobuses] ON 

INSERT [dbo].[Autobuses] ([idAutobus], [idOrganizacion], [placa]) VALUES (5001, 1001, N'000111000')
SET IDENTITY_INSERT [dbo].[Autobuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Clases] ON 

INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1001, N'MM110', N'Matematicas I', 900, 1000)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1002, N'MM111', N'Geometria', 900, 1000)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1003, N'SC101', N'Sociologia', 900, 1000)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1004, N'MM314', N'Programacion I', 900, 1000)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1005, N'MM201', N'Calculo I', 900, 1000)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1006, N'MM211', N'Vectores y Matrices', 900, 1000)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1007, N'IN101', N'Ingles I', 900, 1000)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1008, N'MM110', N'Matematicas I', 1000, 1100)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1009, N'MM110', N'Matematicas I', 1100, 1200)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1010, N'MM110', N'Matematicas I', 1200, 1300)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1011, N'MM110', N'Matematicas I', 1300, 1400)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1012, N'MM110', N'Matematicas I', 1400, 1500)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1013, N'MM111', N'Geometria', 1000, 1100)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1014, N'MM111', N'Geometria', 1100, 1200)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1015, N'MM111', N'Geometria', 1200, 1300)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1016, N'MM111', N'Geometria', 1300, 1400)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1017, N'MM111', N'Geometria', 1400, 1500)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1018, N'SC101', N'Sociologia', 1000, 1100)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1019, N'SC101', N'Sociologia', 1100, 1200)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1020, N'SC101', N'Sociologia', 1200, 1300)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1021, N'SC101', N'Sociologia', 1300, 1400)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1022, N'SC101', N'Sociologia', 1400, 1500)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1023, N'MM314', N'Programacion I', 1000, 1100)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1024, N'MM314', N'Programacion I', 1100, 1200)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1025, N'MM314', N'Programacion I', 1200, 1300)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1026, N'MM314', N'Programacion I', 1300, 1400)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1027, N'MM314', N'Programacion I', 1400, 1500)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1028, N'MM201', N'Calculo I', 1000, 1100)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1029, N'MM201', N'Calculo I', 1100, 1200)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1030, N'MM201', N'Calculo I', 1200, 1300)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1031, N'MM201', N'Calculo I', 1300, 1400)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1032, N'MM201', N'Calculo I', 1400, 1500)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1033, N'MM211', N'Vectores y Matrices', 1000, 1100)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1034, N'MM211', N'Vectores y Matrices', 1100, 1200)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1035, N'MM211', N'Vectores y Matrices', 1200, 1300)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1036, N'MM211', N'Vectores y Matrices', 1300, 1400)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1037, N'MM211', N'Vectores y Matrices', 1400, 1500)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1038, N'IN101', N'Ingles I', 1000, 1100)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1039, N'IN101', N'Ingles I', 1100, 1200)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1040, N'IN101', N'Ingles I', 1200, 1300)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1041, N'IN101', N'Ingles I', 1300, 1400)
INSERT [dbo].[Clases] ([idClase], [codigo], [nombre], [horaInicio], [horaFinal]) VALUES (1042, N'IN101', N'Ingles I', 1400, 1500)
SET IDENTITY_INSERT [dbo].[Clases] OFF
GO
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1000, 2001, 1001)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1001, 2001, 1013)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1002, 2001, 1019)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1003, 2002, 1020)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1004, 2002, 1041)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1005, 2002, 1042)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1006, 2003, 1002)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1007, 2003, 1026)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1008, 2004, 1036)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1009, 2004, 1032)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1010, 2005, 1018)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1011, 2005, 1034)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1012, 2005, 1030)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1013, 2005, 1036)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1014, 2005, 1042)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1015, 2006, 1042)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1016, 2007, 1026)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1017, 2007, 1042)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1018, 2008, 1001)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1019, 2008, 1018)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1020, 2008, 1014)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1021, 2009, 1014)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1022, 2009, 1020)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1023, 2009, 1036)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1024, 2010, 1031)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1025, 2010, 1022)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1027, 2011, 1014)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1028, 2011, 1025)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1029, 2011, 1012)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1030, 2012, 1009)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1031, 2012, 1036)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1032, 2012, 1042)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1033, 2013, 1016)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1034, 2013, 1032)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1035, 2014, 1003)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1036, 2014, 1023)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1037, 2014, 1034)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1038, 2015, 1034)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1039, 2015, 1015)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1040, 2015, 1031)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1041, 2016, 1002)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1042, 2016, 1018)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1043, 2016, 1029)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1044, 2017, 1029)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1045, 2017, 1035)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1046, 2017, 1041)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1047, 2018, 1005)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1048, 2018, 1039)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1049, 2019, 1039)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1050, 2019, 1037)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1051, 2020, 1031)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1052, 2020, 1027)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1053, 2021, 1009)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1054, 2021, 1040)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1055, 2021, 1042)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1056, 2022, 1008)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1057, 2022, 1009)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1058, 2023, 1008)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1059, 2023, 1009)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1060, 2024, 1008)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1061, 2024, 1009)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1062, 2024, 1025)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1063, 2025, 1005)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1064, 2025, 1015)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1065, 2025, 1021)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1066, 2026, 1021)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1067, 2026, 1042)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1068, 2027, 1026)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1069, 2027, 1010)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1070, 2027, 1041)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1071, 2028, 1003)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1072, 2028, 1023)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1073, 2028, 1024)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1074, 2029, 1006)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1075, 2029, 1009)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1076, 2029, 1037)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1077, 2030, 1020)
INSERT [dbo].[Matricula] ([idMatricula], [idAlumno], [idClase]) VALUES (1078, 2030, 1027)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
GO
SET IDENTITY_INSERT [dbo].[Organizaciones] ON 

INSERT [dbo].[Organizaciones] ([idOrganizacion], [nombre], [direccion], [tipo], [idUsuario], [contrasenia], [logotipo], [pColores]) VALUES (1001, N'UNAH', N'Tegucigalpa', N'Universidad', 12345, N'12345', N'---', N'---')
SET IDENTITY_INSERT [dbo].[Organizaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Puntos] ON 

INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7001, 3001, 0, N'A', N'punto 1', 0)
INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7002, 3001, 1, N'A', N'punto 2', 0)
INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7003, 3001, 2, N'B', N'Centro', 1)
INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7004, 3002, 0, N'A', N'punto 1', 0)
INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7005, 3002, 1, N'B', N'Carrizal', 1)
INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7006, 3003, 0, N'C', N'punto 1', 0)
INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7007, 3003, 1, N'D', N'punto 2', 0)
INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7008, 3003, 2, N'E', N'Hato', 1)
INSERT [dbo].[Puntos] ([idPunto], [idRuta], [valor], [sector], [nombre], [final]) VALUES (7009, 3003, 3, N'E', N'Hato', 1)
SET IDENTITY_INSERT [dbo].[Puntos] OFF
GO
SET IDENTITY_INSERT [dbo].[Recorridos] ON 

INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4344, 3004, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4345, 3005, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4346, 3002, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4347, 3001, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4348, 3003, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4349, 3007, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4350, 3006, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4351, 3008, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4352, 3004, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4353, 3005, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4354, 3002, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4355, 3001, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4356, 3003, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4357, 3007, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4358, 3006, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4359, 3008, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4360, 3004, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4361, 3005, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4362, 3002, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4363, 3001, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4364, 3003, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4365, 3004, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4366, 3005, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4367, 3006, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4368, 3002, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4369, 3001, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4370, 3003, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4371, 3007, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4372, 3008, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4373, 3004, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4374, 3005, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4375, 3006, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4376, 3002, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4377, 3001, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4378, 3003, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4379, 3007, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4380, 3008, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4381, 3004, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4382, 3005, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4383, 3002, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4384, 3001, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4385, 3003, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4386, 3004, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4387, 3005, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4388, 3006, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4389, 3002, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4390, 3001, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4391, 3003, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4392, 3007, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4393, 3008, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4394, 3004, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4395, 3005, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4396, 3006, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4397, 3002, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4398, 3001, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4399, 3003, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4400, 3007, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4401, 3008, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4402, 3004, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4403, 3005, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4404, 3002, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4405, 3001, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4406, 3003, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4407, 3004, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4408, 3005, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4409, 3002, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4410, 3001, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4411, 3003, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4412, 3007, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4413, 3006, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4414, 3008, 5001, 1100, 1200, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4415, 3005, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4416, 3004, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4417, 3002, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4418, 3001, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4419, 3003, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4420, 3007, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4421, 3006, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4422, 3008, 5001, 1300, 1400, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4423, 3005, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4424, 3004, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4425, 3002, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4426, 3001, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
INSERT [dbo].[Recorridos] ([idRecorrido], [idRuta], [idAutobus], [horaSalida], [horaEntrada], [fecha]) VALUES (4427, 3003, 5001, 1400, 1500, CAST(N'2022-12-05' AS Date))
SET IDENTITY_INSERT [dbo].[Recorridos] OFF
GO
SET IDENTITY_INSERT [dbo].[Registros] ON 

INSERT [dbo].[Registros] ([idRegistro], [idAlumno], [idRecorrido], [horaIngreso], [horaSalida]) VALUES (6012, 2001, 4344, CAST(N'2022-12-05T16:35:42.787' AS DateTime), CAST(N'2022-12-05T16:35:42.787' AS DateTime))
INSERT [dbo].[Registros] ([idRegistro], [idAlumno], [idRecorrido], [horaIngreso], [horaSalida]) VALUES (6013, 2001, 4346, CAST(N'2022-12-05T16:40:01.650' AS DateTime), CAST(N'2022-12-05T16:40:01.650' AS DateTime))
INSERT [dbo].[Registros] ([idRegistro], [idAlumno], [idRecorrido], [horaIngreso], [horaSalida]) VALUES (6014, 2001, 4351, CAST(N'2022-12-05T16:51:04.010' AS DateTime), CAST(N'2022-12-05T16:51:04.010' AS DateTime))
INSERT [dbo].[Registros] ([idRegistro], [idAlumno], [idRecorrido], [horaIngreso], [horaSalida]) VALUES (6015, 2001, 4350, CAST(N'2022-12-05T16:52:34.083' AS DateTime), CAST(N'2022-12-05T16:52:34.083' AS DateTime))
INSERT [dbo].[Registros] ([idRegistro], [idAlumno], [idRecorrido], [horaIngreso], [horaSalida]) VALUES (6016, 2001, 4358, CAST(N'2022-12-05T16:52:46.180' AS DateTime), CAST(N'2022-12-05T16:52:46.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[Registros] OFF
GO
SET IDENTITY_INSERT [dbo].[Rutas] ON 

INSERT [dbo].[Rutas] ([idRuta], [idOrganizacion], [nombreRuta], [precio]) VALUES (3001, 1001, N'Centro', 10.0000)
INSERT [dbo].[Rutas] ([idRuta], [idOrganizacion], [nombreRuta], [precio]) VALUES (3002, 1001, N'Carrizal', 15.0000)
INSERT [dbo].[Rutas] ([idRuta], [idOrganizacion], [nombreRuta], [precio]) VALUES (3003, 1001, N'Hato', 12.0000)
INSERT [dbo].[Rutas] ([idRuta], [idOrganizacion], [nombreRuta], [precio]) VALUES (3004, 1001, N'Kennedy', 17.0000)
INSERT [dbo].[Rutas] ([idRuta], [idOrganizacion], [nombreRuta], [precio]) VALUES (3005, 1001, N'Loarque', 8.0000)
INSERT [dbo].[Rutas] ([idRuta], [idOrganizacion], [nombreRuta], [precio]) VALUES (3006, 1001, N'Res La Vega', 15.0000)
INSERT [dbo].[Rutas] ([idRuta], [idOrganizacion], [nombreRuta], [precio]) VALUES (3007, 1001, N'Res La Plaza', 10.0000)
INSERT [dbo].[Rutas] ([idRuta], [idOrganizacion], [nombreRuta], [precio]) VALUES (3008, 1001, N'San Pablo', 12.0000)
SET IDENTITY_INSERT [dbo].[Rutas] OFF
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Alumnos_Organizaciones] FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizaciones] ([idOrganizacion])
GO
ALTER TABLE [dbo].[Alumnos] CHECK CONSTRAINT [FK_Alumnos_Organizaciones]
GO
ALTER TABLE [dbo].[Autobuses]  WITH CHECK ADD  CONSTRAINT [FK_Autobuses_Organizaciones] FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizaciones] ([idOrganizacion])
GO
ALTER TABLE [dbo].[Autobuses] CHECK CONSTRAINT [FK_Autobuses_Organizaciones]
GO
ALTER TABLE [dbo].[Conductores]  WITH CHECK ADD  CONSTRAINT [FK_Conductores_Autobuses] FOREIGN KEY([idAutobus])
REFERENCES [dbo].[Autobuses] ([idAutobus])
GO
ALTER TABLE [dbo].[Conductores] CHECK CONSTRAINT [FK_Conductores_Autobuses]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Alumnos] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumno])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Alumnos]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Clases] FOREIGN KEY([idClase])
REFERENCES [dbo].[Clases] ([idClase])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Clases]
GO
ALTER TABLE [dbo].[Puntos]  WITH CHECK ADD  CONSTRAINT [FK_Puntos_Rutas] FOREIGN KEY([idRuta])
REFERENCES [dbo].[Rutas] ([idRuta])
GO
ALTER TABLE [dbo].[Puntos] CHECK CONSTRAINT [FK_Puntos_Rutas]
GO
ALTER TABLE [dbo].[Recorridos]  WITH CHECK ADD  CONSTRAINT [FK_Recorridos_Autobuses] FOREIGN KEY([idAutobus])
REFERENCES [dbo].[Autobuses] ([idAutobus])
GO
ALTER TABLE [dbo].[Recorridos] CHECK CONSTRAINT [FK_Recorridos_Autobuses]
GO
ALTER TABLE [dbo].[Recorridos]  WITH CHECK ADD  CONSTRAINT [FK_Recorridos_Rutas] FOREIGN KEY([idRuta])
REFERENCES [dbo].[Rutas] ([idRuta])
GO
ALTER TABLE [dbo].[Recorridos] CHECK CONSTRAINT [FK_Recorridos_Rutas]
GO
ALTER TABLE [dbo].[Registros]  WITH CHECK ADD  CONSTRAINT [FK_Registros_Alumnos] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumno])
GO
ALTER TABLE [dbo].[Registros] CHECK CONSTRAINT [FK_Registros_Alumnos]
GO
ALTER TABLE [dbo].[Registros]  WITH CHECK ADD  CONSTRAINT [FK_Registros_Recorridos] FOREIGN KEY([idRecorrido])
REFERENCES [dbo].[Recorridos] ([idRecorrido])
GO
ALTER TABLE [dbo].[Registros] CHECK CONSTRAINT [FK_Registros_Recorridos]
GO
ALTER TABLE [dbo].[Rutas]  WITH CHECK ADD  CONSTRAINT [FK_Rutas_Organizaciones] FOREIGN KEY([idOrganizacion])
REFERENCES [dbo].[Organizaciones] ([idOrganizacion])
GO
ALTER TABLE [dbo].[Rutas] CHECK CONSTRAINT [FK_Rutas_Organizaciones]
GO
ALTER TABLE [dbo].[RutasAlumnos]  WITH CHECK ADD  CONSTRAINT [FK_RutasAlumnos_Alumnos] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumno])
GO
ALTER TABLE [dbo].[RutasAlumnos] CHECK CONSTRAINT [FK_RutasAlumnos_Alumnos]
GO
USE [master]
GO
ALTER DATABASE [FastTravel] SET  READ_WRITE 
GO
