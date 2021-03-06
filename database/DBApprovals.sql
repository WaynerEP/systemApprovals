USE [master]
GO
/****** Object:  Database [DBApprovals]    Script Date: 23/12/2021 10:16:38 ******/
CREATE DATABASE [DBApprovals]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBApprovals', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBApprovals.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBApprovals_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBApprovals_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBApprovals] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBApprovals].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBApprovals] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBApprovals] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBApprovals] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBApprovals] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBApprovals] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBApprovals] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBApprovals] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBApprovals] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBApprovals] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBApprovals] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBApprovals] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBApprovals] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBApprovals] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBApprovals] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBApprovals] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBApprovals] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBApprovals] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBApprovals] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBApprovals] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBApprovals] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBApprovals] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBApprovals] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBApprovals] SET RECOVERY FULL 
GO
ALTER DATABASE [DBApprovals] SET  MULTI_USER 
GO
ALTER DATABASE [DBApprovals] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBApprovals] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBApprovals] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBApprovals] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBApprovals] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBApprovals] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBApprovals', N'ON'
GO
ALTER DATABASE [DBApprovals] SET QUERY_STORE = OFF
GO
USE [DBApprovals]
GO
/****** Object:  Table [dbo].[aprobaciones]    Script Date: 23/12/2021 10:16:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aprobaciones](
	[idAprobacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[observaciones] [varchar](255) NULL,
	[estado] [char](1) NOT NULL,
	[codEmpleado] [int] NOT NULL,
	[motivoDesicion] [varchar](255) NOT NULL,
	[idSolicitud] [int] NOT NULL,
 CONSTRAINT [PK_soli_aproba] PRIMARY KEY CLUSTERED 
(
	[idAprobacion] ASC,
	[idSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[areas]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areas](
	[idArea] [tinyint] IDENTITY(1,1) NOT NULL,
	[area_descripcion] [varchar](80) NOT NULL,
	[idDepart] [tinyint] NULL,
 CONSTRAINT [XPKareas] PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cargos]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargos](
	[idCargo] [tinyint] IDENTITY(1,1) NOT NULL,
	[cargo] [varchar](80) NOT NULL,
	[idArea] [tinyint] NOT NULL,
 CONSTRAINT [XPKcargos] PRIMARY KEY CLUSTERED 
(
	[idCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudadanos]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudadanos](
	[dniCiudadano] [char](8) NOT NULL,
	[nombres] [varchar](30) NOT NULL,
	[apellidos] [varchar](30) NOT NULL,
	[sexo] [char](10) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[correo] [varchar](200) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
	[telefono1] [char](10) NOT NULL,
	[telefono2] [char](10) NULL,
	[referencia] [varchar](255) NULL,
	[estado] [char](1) NOT NULL,
	[codDistrito] [int] NOT NULL,
	[idNivel] [tinyint] NOT NULL,
 CONSTRAINT [XPKciudadanos] PRIMARY KEY CLUSTERED 
(
	[dniCiudadano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamentos](
	[codDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[departamento] [varchar](80) NOT NULL,
 CONSTRAINT [XPKdepartamentos] PRIMARY KEY CLUSTERED 
(
	[codDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departEmpresa]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departEmpresa](
	[idDepart] [tinyint] IDENTITY(1,1) NOT NULL,
	[departamento] [varchar](80) NOT NULL,
 CONSTRAINT [XPKdepartEmpresa] PRIMARY KEY CLUSTERED 
(
	[idDepart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detallePedidos]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallePedidos](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idDetalle] [int] NOT NULL,
	[cantidad] [smallint] NOT NULL,
	[costoUnitario] [float] NOT NULL,
	[descuento] [float] NOT NULL,
 CONSTRAINT [XPKdetallePedidos] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleProformaProveedor]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleProformaProveedor](
	[idDetalleProforma] [int] IDENTITY(1,1) NOT NULL,
	[precio] [float] NOT NULL,
	[fRecepcion] [datetime] NOT NULL,
	[idDetalle] [int] NOT NULL,
	[idProforma] [int] NOT NULL,
 CONSTRAINT [XPKdetalleProformaProveedor] PRIMARY KEY CLUSTERED 
(
	[idDetalleProforma] ASC,
	[idProforma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distritos]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distritos](
	[codDistrito] [int] IDENTITY(1,1) NOT NULL,
	[distrito] [varchar](100) NOT NULL,
	[codProvincia] [int] NOT NULL,
 CONSTRAINT [XPKdistritos] PRIMARY KEY CLUSTERED 
(
	[codDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[dniCiudadano] [char](8) NOT NULL,
	[codEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[idCargo] [tinyint] NOT NULL,
	[observaciones] [varchar](255) NULL,
	[sueldo] [float] NOT NULL,
	[estadoEmpleado] [char](1) NOT NULL,
 CONSTRAINT [XPKempleados] PRIMARY KEY CLUSTERED 
(
	[codEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[failed_jobs]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[failed_jobs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[uuid] [nvarchar](255) NOT NULL,
	[connection] [nvarchar](max) NOT NULL,
	[queue] [nvarchar](max) NOT NULL,
	[payload] [nvarchar](max) NOT NULL,
	[exception] [nvarchar](max) NOT NULL,
	[failed_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[model_has_permissions]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[model_has_permissions](
	[permission_id] [bigint] NOT NULL,
	[model_type] [nvarchar](255) NOT NULL,
	[model_id] [bigint] NOT NULL,
 CONSTRAINT [model_has_permissions_permission_model_type_primary] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC,
	[model_id] ASC,
	[model_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[model_has_roles]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[model_has_roles](
	[role_id] [bigint] NOT NULL,
	[model_type] [nvarchar](255) NOT NULL,
	[model_id] [bigint] NOT NULL,
 CONSTRAINT [model_has_roles_role_model_type_primary] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[model_id] ASC,
	[model_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nivelStudios]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nivelStudios](
	[idNivel] [tinyint] IDENTITY(1,1) NOT NULL,
	[nivel] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[organizacion]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[organizacion](
	[ruc] [char](11) NOT NULL,
	[razonSocial] [varchar](100) NOT NULL,
	[logo] [text] NULL,
	[rubro] [varchar](255) NOT NULL,
	[igv] [int] NULL,
	[direccion] [varchar](255) NOT NULL,
	[correo] [varchar](255) NOT NULL,
	[numTelefonico] [char](10) NOT NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [XPKorganizacion] PRIMARY KEY CLUSTERED 
(
	[ruc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_resets]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_resets](
	[email] [nvarchar](255) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[created_at] [datetime2](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidos](
	[monto] [float] NOT NULL,
	[fechaPedido] [datetime] NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [XPKpedidos] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[guard_name] [nvarchar](255) NOT NULL,
	[created_at] [datetime2](4) NULL,
	[updated_at] [datetime2](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personal_access_tokens]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personal_access_tokens](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tokenable_type] [nvarchar](255) NOT NULL,
	[tokenable_id] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[token] [nvarchar](64) NOT NULL,
	[abilities] [nvarchar](max) NULL,
	[last_used_at] [datetime] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[idTipo] [int] NOT NULL,
	[descripcionProducto] [varchar](100) NOT NULL,
	[medida] [varchar](80) NOT NULL,
	[precioC] [float] NOT NULL,
	[precioV] [float] NOT NULL,
	[stock] [smallint] NOT NULL,
	[estado] [char](1) NOT NULL,
	[image] [text] NULL,
 CONSTRAINT [XPKproductos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proformaProveedor]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proformaProveedor](
	[fRecepcion] [datetime] NOT NULL,
	[fEnvio] [datetime] NOT NULL,
	[idProveedor] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
	[idProforma] [int] NOT NULL,
 CONSTRAINT [XPKproformaProveedor] PRIMARY KEY CLUSTERED 
(
	[idProforma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedores]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedores](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[estado] [char](1) NOT NULL,
	[dniRepresentante] [char](8) NOT NULL,
	[razonSocial] [varchar](80) NOT NULL,
	[direccion] [varchar](250) NULL,
	[ciudad] [varchar](250) NULL,
	[telefono] [char](10) NULL,
	[codPostal] [char](6) NULL,
	[email] [varchar](250) NULL,
 CONSTRAINT [XPKproveedores] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[codProvincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](100) NOT NULL,
	[codDepartamento] [int] NOT NULL,
 CONSTRAINT [XPKprovincias] PRIMARY KEY CLUSTERED 
(
	[codProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_has_permissions]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_has_permissions](
	[permission_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
 CONSTRAINT [role_has_permissions_permission_id_role_id_primary] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[guard_name] [nvarchar](255) NOT NULL,
	[created_at] [datetime2](4) NULL,
	[updated_at] [datetime2](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitudes]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitudes](
	[idSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
	[estadoSolicitud] [char](1) NOT NULL,
	[idPedido] [int] NOT NULL,
 CONSTRAINT [XPKsolicitudes] PRIMARY KEY CLUSTERED 
(
	[idSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitudesProforma]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitudesProforma](
	[idSolicitud] [int] NOT NULL,
	[idProforma] [int] NOT NULL,
	[observacion] [char](18) NULL,
	[estado] [char](18) NULL,
 CONSTRAINT [XPKsolicitudesProforma] PRIMARY KEY CLUSTERED 
(
	[idSolicitud] ASC,
	[idProforma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoProducto]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoProducto](
	[idTipo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [XPKtipoProducto] PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[email_verified_at] [datetime2](4) NULL,
	[password] [nvarchar](255) NOT NULL,
	[last_login] [datetime2](4) NULL,
	[status] [nchar](1) NOT NULL,
	[code_empleado] [int] NOT NULL,
	[avatar] [nvarchar](255) NULL,
	[google_id] [nvarchar](255) NULL,
	[google_token] [nvarchar](255) NULL,
	[remember_token] [nvarchar](100) NULL,
	[created_at] [datetime2](4) NULL,
	[updated_at] [datetime2](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[areas] ON 

INSERT [dbo].[areas] ([idArea], [area_descripcion], [idDepart]) VALUES (1, N'Ventas', 2)
INSERT [dbo].[areas] ([idArea], [area_descripcion], [idDepart]) VALUES (2, N'Compras', 1)
INSERT [dbo].[areas] ([idArea], [area_descripcion], [idDepart]) VALUES (3, N'Publicidad', 7)
INSERT [dbo].[areas] ([idArea], [area_descripcion], [idDepart]) VALUES (4, N'Produccion', 5)
INSERT [dbo].[areas] ([idArea], [area_descripcion], [idDepart]) VALUES (5, N'Finanzas', 6)
INSERT [dbo].[areas] ([idArea], [area_descripcion], [idDepart]) VALUES (6, N'Proyectos', 5)
INSERT [dbo].[areas] ([idArea], [area_descripcion], [idDepart]) VALUES (7, N'Logistica', 7)
SET IDENTITY_INSERT [dbo].[areas] OFF
GO
SET IDENTITY_INSERT [dbo].[cargos] ON 

INSERT [dbo].[cargos] ([idCargo], [cargo], [idArea]) VALUES (1, N'Gerente Financiero', 5)
INSERT [dbo].[cargos] ([idCargo], [cargo], [idArea]) VALUES (2, N'Gerente Comercial', 1)
INSERT [dbo].[cargos] ([idCargo], [cargo], [idArea]) VALUES (3, N'Gerente de Servicios Administrativos', 6)
INSERT [dbo].[cargos] ([idCargo], [cargo], [idArea]) VALUES (4, N'Gerente de Marketing', 3)
INSERT [dbo].[cargos] ([idCargo], [cargo], [idArea]) VALUES (5, N'Gerente de Ventas', 1)
INSERT [dbo].[cargos] ([idCargo], [cargo], [idArea]) VALUES (6, N'Gerente de Logística', 7)
SET IDENTITY_INSERT [dbo].[cargos] OFF
GO
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000000', N'RANDALL MANFRED', N'ESPINOZA PEREZ', N'M         ', CAST(N'1999-09-22' AS Date), N'respinozap@unitru.edu.pe', N'Jr. Salaverry 701', N'980075168 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000001', N'WAYNER KEYLOR', N'ESPINOZA PEREZ', N'M         ', CAST(N'2001-04-25' AS Date), N'espinozaperez2504@gmail.com', N'Jr. Salaverry 702', N'930127991 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000002', N'LUIS FERNANDO', N'IZQUIERDO LOZANO', N'M         ', CAST(N'2001-04-02' AS Date), N'lizquierdo@unitru.edu.pe', N'Av. Santa Rosa 627', N'938208559 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000003', N'NOOR MARIA DE LOS ANGELES', N'AMAMBAL CORONADO', N'F         ', CAST(N'2001-03-02' AS Date), N'amambal@gmail.com', N'Av. Ezequiel', N'968452650 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000004', N'JERSSON ALEXIS', N'CHILON NUÑEZ', N'F         ', CAST(N'2001-08-07' AS Date), N'chilon@gmail.com', N'Jr. Alianza 705', N'957630691 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000005', N'VICTOR ANTONIO', N'CHARCAPE RAVELO', N'M         ', CAST(N'1991-03-11' AS Date), N'vcharcape@unitru.edu.pe', N'Urb. San Juan 1156', N'980075173 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000006', N'JAIME', N'CENTURION', N'M         ', CAST(N'1991-12-08' AS Date), N'centurion@unitru.edi.pe', N'Av. Los Pinos', N'980075174 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000007', N'ELDER IVAN', N'REQUENA TOLEDO', N'M         ', CAST(N'1990-12-09' AS Date), N'plusmoregarcia@gmail.com', N'Av. Los Peraltas 987', N'938208558 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000008', N'LIRA', N'SABOYA PISCO', N'F         ', CAST(N'1991-08-04' AS Date), N'randallmanfredespinozaperez@gmail.com', N'Jr. Pirola 123', N'980075176 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000009', N'ADELFIO', N'PEREZ JARA', N'M         ', CAST(N'1990-01-14' AS Date), N'kperezespi@gmail.com', N'Jr. Miguel Grau', N'980075177 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000011', N'ANGEL RICHARD', N'COTRINA ESCOBAL', N'M         ', CAST(N'1990-11-14' AS Date), N'acotrina@unitru.edu.pe', N'Av. Sali rosas', N'980075178 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000012', N'KEVIN', N'SAUCEDO HUAMAN', N'M         ', CAST(N'1990-03-20' AS Date), N'ksaucedo@unitru.edu.pe', N'Av. Dos de Mayo', N'980075179 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000013', N'NURI VICTORIA', N'TASILLA UCEDA', N'F         ', CAST(N'1991-11-03' AS Date), N'ntasilla@unitru.edu.pe', N'Jr. San Miguel', N'980075180 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000014', N'JUAN LUIS', N'CORDOVA OTERO', N'M         ', CAST(N'1990-12-20' AS Date), N'jcordovao@unitru.edu.pe', N'Urb. San SebastiÃ¡n', N'980075181 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'46000015', N'LISSET KARLA', N'JARA VARGAS', N'F         ', CAST(N'1991-10-05' AS Date), N'lissetkarla@gmail.com', N'Jr. Los Manzanos', N'980075182 ', NULL, NULL, N'1', 1154, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'74122465', N'WAYNER', N'ESPINOZA PEREZ', N'M         ', CAST(N'2001-04-25' AS Date), N'espinozaperezb2504@gmail.com', N'Centro Poblado Tolón', N'930127991 ', NULL, N'Un árbol', N'1', 1129, 7)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'74122466', N'Andres', N'Izqueirdo', N'M         ', CAST(N'2001-04-25' AS Date), N'andres@gmail.com', N'Micasa', N'930127998 ', NULL, NULL, N'1', 812, 3)
INSERT [dbo].[ciudadanos] ([dniCiudadano], [nombres], [apellidos], [sexo], [fechaNacimiento], [correo], [direccion], [telefono1], [telefono2], [referencia], [estado], [codDistrito], [idNivel]) VALUES (N'78945612', N'Mami Martha', N'Sampertiga', N'M         ', CAST(N'1900-12-02' AS Date), N'martitatugatita@gmail.com', N'Casa del Izquierdo', N'123456789 ', NULL, NULL, N'1', 1129, 6)
GO
SET IDENTITY_INSERT [dbo].[departamentos] ON 

INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (1, N'AMAZONAS')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (2, N'ANCASH')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (3, N'APURIMAC')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (4, N'AREQUIPA')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (5, N'AYACUCHO')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (6, N'CAJAMARCA')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (7, N'CALLAO')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (8, N'CUSCO')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (9, N'HUANCAVELICA')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (10, N'HUANUCO')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (11, N'ICA')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (12, N'JUNIN')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (13, N'LA LIBERTAD')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (14, N'LAMBAYEQUE')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (15, N'LIMA')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (16, N'LORETO')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (17, N'MADRE DE DIOS')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (18, N'MOQUEGUA')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (19, N'PASCO')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (20, N'PIURA')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (21, N'PUNO')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (22, N'SAN MARTIN')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (23, N'TACNA')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (24, N'TUMBES')
INSERT [dbo].[departamentos] ([codDepartamento], [departamento]) VALUES (25, N'UCAYALI')
SET IDENTITY_INSERT [dbo].[departamentos] OFF
GO
SET IDENTITY_INSERT [dbo].[departEmpresa] ON 

INSERT [dbo].[departEmpresa] ([idDepart], [departamento]) VALUES (1, N'Compras')
INSERT [dbo].[departEmpresa] ([idDepart], [departamento]) VALUES (2, N'Comercial')
INSERT [dbo].[departEmpresa] ([idDepart], [departamento]) VALUES (3, N'Financiero')
INSERT [dbo].[departEmpresa] ([idDepart], [departamento]) VALUES (4, N'Administrativo')
INSERT [dbo].[departEmpresa] ([idDepart], [departamento]) VALUES (5, N'Logistica y Operaciones')
INSERT [dbo].[departEmpresa] ([idDepart], [departamento]) VALUES (6, N'Recursos Humanos')
INSERT [dbo].[departEmpresa] ([idDepart], [departamento]) VALUES (7, N'Marketing')
INSERT [dbo].[departEmpresa] ([idDepart], [departamento]) VALUES (8, N'Direccion General')
SET IDENTITY_INSERT [dbo].[departEmpresa] OFF
GO
SET IDENTITY_INSERT [dbo].[distritos] ON 

INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1, N'CHACHAPOYAS', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (2, N'ASUNCION', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (3, N'BALSAS', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (4, N'CHETO', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (5, N'CHILIQUIN', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (6, N'CHUQUIBAMBA', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (7, N'GRANADA', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (8, N'HUANCAS', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (9, N'LA JALCA', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (10, N'LEIMEBAMBA', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (11, N'LEVANTO', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (12, N'MAGDALENA', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (13, N'MARISCAL CASTILLA', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (14, N'MOLINOPAMPA', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (15, N'MONTEVIDEO', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (16, N'OLLEROS', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (17, N'QUINJALCA', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (18, N'SAN FRANCISCO DE DAGUAS', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (19, N'SAN ISIDRO DE MAINO', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (20, N'SOLOCO', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (21, N'SONCHE', 1)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (22, N'LA PECA', 2)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (23, N'ARAMANGO', 2)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (24, N'COPALLIN', 2)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (25, N'EL PARCO', 2)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (26, N'IMAZA', 2)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (27, N'JUMBILLA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (28, N'CHISQUILLA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (29, N'CHURUJA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (30, N'COROSHA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (31, N'CUISPES', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (32, N'FLORIDA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (33, N'JAZAN', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (34, N'RECTA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (35, N'SAN CARLOS', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (36, N'SHIPASBAMBA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (37, N'VALERA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (38, N'YAMBRASBAMBA', 3)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (39, N'NIEVA', 4)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (40, N'EL CENEPA', 4)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (41, N'RIO SANTIAGO', 4)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (42, N'LAMUD', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (43, N'CAMPORREDONDO', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (44, N'COCABAMBA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (45, N'COLCAMAR', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (46, N'CONILA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (47, N'INGUILPATA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (48, N'LONGUITA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (49, N'LONYA CHICO', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (50, N'LUYA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (51, N'LUYA VIEJO', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (52, N'MARIA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (53, N'OCALLI', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (54, N'OCUMAL', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (55, N'PISUQUIA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (56, N'PROVIDENCIA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (57, N'SAN CRISTOBAL', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (58, N'SAN FRANCISCO DEL YESO', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (59, N'SAN JERONIMO', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (60, N'SAN JUAN DE LOPECANCHA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (61, N'SANTA CATALINA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (62, N'SANTO TOMAS', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (63, N'TINGO', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (64, N'TRITA', 5)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (65, N'SAN NICOLAS', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (66, N'CHIRIMOTO', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (67, N'COCHAMAL', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (68, N'HUAMBO', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (69, N'LIMABAMBA', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (70, N'LONGAR', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (71, N'MARISCAL BENAVIDES', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (72, N'MILPUC', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (73, N'OMIA', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (74, N'SANTA ROSA', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (75, N'TOTORA', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (76, N'VISTA ALEGRE', 6)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (77, N'BAGUA GRANDE', 7)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (78, N'CAJARURO', 7)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (79, N'CUMBA', 7)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (80, N'EL MILAGRO', 7)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (81, N'JAMALCA', 7)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (82, N'LONYA GRANDE', 7)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (83, N'YAMON', 7)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (84, N'HUARAZ', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (85, N'COCHABAMBA', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (86, N'COLCABAMBA', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (87, N'HUANCHAY', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (88, N'INDEPENDENCIA', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (89, N'JANGAS', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (90, N'LA LIBERTAD', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (91, N'OLLEROS', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (92, N'PAMPAS', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (93, N'PARIACOTO', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (94, N'PIRA', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (95, N'TARICA', 8)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (96, N'AIJA', 9)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (97, N'CORIS', 9)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (98, N'HUACLLAN', 9)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (99, N'LA MERCED', 9)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (100, N'SUCCHA', 9)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (101, N'LLAMELLIN', 10)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (102, N'ACZO', 10)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (103, N'CHACCHO', 10)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (104, N'CHINGAS', 10)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (105, N'MIRGAS', 10)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (106, N'SAN JUAN DE RONTOY', 10)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (107, N'CHACAS', 11)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (108, N'ACOCHACA', 11)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (109, N'CHIQUIAN', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (110, N'ABELARDO PARDO LEZAMETA', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (111, N'ANTONIO RAYMONDI', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (112, N'AQUIA', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (113, N'CAJACAY', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (114, N'CANIS', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (115, N'COLQUIOC', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (116, N'HUALLANCA', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (117, N'HUASTA', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (118, N'HUAYLLACAYAN', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (119, N'LA PRIMAVERA', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (120, N'MANGAS', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (121, N'PACLLON', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (122, N'SAN MIGUEL DE CORPANQUI', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (123, N'TICLLOS', 12)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (124, N'CARHUAZ', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (125, N'ACOPAMPA', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (126, N'AMASHCA', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (127, N'ANTA', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (128, N'ATAQUERO', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (129, N'MARCARA', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (130, N'PARIAHUANCA', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (131, N'SAN MIGUEL DE ACO', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (132, N'SHILLA', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (133, N'TINCO', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (134, N'YUNGAR', 13)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (135, N'SAN LUIS', 14)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (136, N'SAN NICOLAS', 14)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (137, N'YAUYA', 14)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (138, N'CASMA', 15)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (139, N'BUENA VISTA ALTA', 15)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (140, N'COMANDANTE NOEL', 15)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (141, N'YAUTAN', 15)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (142, N'CORONGO', 16)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (143, N'ACO', 16)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (144, N'BAMBAS', 16)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (145, N'CUSCA', 16)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (146, N'LA PAMPA', 16)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (147, N'YANAC', 16)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (148, N'YUPAN', 16)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (149, N'HUARI', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (150, N'ANRA', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (151, N'CAJAY', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (152, N'CHAVIN DE HUANTAR', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (153, N'HUACACHI', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (154, N'HUACCHIS', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (155, N'HUACHIS', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (156, N'HUANTAR', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (157, N'MASIN', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (158, N'PAUCAS', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (159, N'PONTO', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (160, N'RAHUAPAMPA', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (161, N'RAPAYAN', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (162, N'SAN MARCOS', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (163, N'SAN PEDRO DE CHANA', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (164, N'UCO', 17)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (165, N'HUARMEY', 18)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (166, N'COCHAPETI', 18)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (167, N'CULEBRAS', 18)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (168, N'HUAYAN', 18)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (169, N'MALVAS', 18)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (170, N'CARAZ', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (171, N'HUALLANCA', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (172, N'HUATA', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (173, N'HUAYLAS', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (174, N'MATO', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (175, N'PAMPAROMAS', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (176, N'PUEBLO LIBRE', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (177, N'SANTA CRUZ', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (178, N'SANTO TORIBIO', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (179, N'YURACMARCA', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (180, N'PISCOBAMBA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (181, N'CASCA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (182, N'ELEAZAR GUZMAN BARRON', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (183, N'FIDEL OLIVAS ESCUDERO', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (184, N'LLAMA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (185, N'LLUMPA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (186, N'LUCMA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (187, N'MUSGA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (188, N'OCROS', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (189, N'ACAS', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (190, N'CAJAMARQUILLA', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (191, N'CARHUAPAMPA', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (192, N'COCHAS', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (193, N'CONGAS', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (194, N'LLIPA', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (195, N'SAN CRISTOBAL DE RAJAN', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (196, N'SAN PEDRO', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (197, N'SANTIAGO DE CHILCAS', 21)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (198, N'CABANA', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (199, N'BOLOGNESI', 22)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (200, N'CONCHUCOS', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (201, N'HUACASCHUQUE', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (202, N'HUANDOVAL', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (203, N'LACABAMBA', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (204, N'LLAPO', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (205, N'PALLASCA', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (206, N'PAMPAS', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (207, N'SANTA ROSA', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (208, N'TAUCA', 22)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (209, N'POMABAMBA', 23)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (210, N'HUAYLLAN', 23)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (211, N'PAROBAMBA', 23)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (212, N'QUINUABAMBA', 23)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (213, N'RECUAY', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (214, N'CATAC', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (215, N'COTAPARACO', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (216, N'HUAYLLAPAMPA', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (217, N'LLACLLIN', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (218, N'MARCA', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (219, N'PAMPAS CHICO', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (220, N'PARARIN', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (221, N'TAPACOCHA', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (222, N'TICAPAMPA', 24)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (223, N'CHIMBOTE', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (224, N'CACERES DEL PERU', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (225, N'COISHCO', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (226, N'MACATE', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (227, N'MORO', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (228, N'NEPE&Ntilde;A', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (229, N'SAMANCO', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (230, N'SANTA', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (231, N'NUEVO CHIMBOTE', 25)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (232, N'SIHUAS', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (233, N'ACOBAMBA', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (234, N'ALFONSO UGARTE', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (235, N'CASHAPAMPA', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (236, N'CHINGALPO', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (237, N'HUAYLLABAMBA', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (238, N'QUICHES', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (239, N'RAGASH', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (240, N'SAN JUAN', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (241, N'SICSIBAMBA', 26)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (242, N'YUNGAY', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (243, N'CASCAPARA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (244, N'MANCOS', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (245, N'MATACOTO', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (246, N'QUILLO', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (247, N'RANRAHIRCA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (248, N'SHUPLUY', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (249, N'YANAMA', 27)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (250, N'ABANCAY', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (251, N'CHACOCHE', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (252, N'CIRCA', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (253, N'CURAHUASI', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (254, N'HUANIPACA', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (255, N'LAMBRAMA', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (256, N'PICHIRHUA', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (257, N'SAN PEDRO DE CACHORA', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (258, N'TAMBURCO', 28)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (259, N'ANDAHUAYLAS', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (260, N'ANDARAPA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (261, N'CHIARA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (262, N'HUANCARAMA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (263, N'HUANCARAY', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (264, N'HUAYANA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (265, N'KISHUARA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (266, N'PACOBAMBA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (267, N'PACUCHA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (268, N'PAMPACHIRI', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (269, N'POMACOCHA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (270, N'SAN ANTONIO DE CACHI', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (271, N'SAN JERONIMO', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (272, N'SAN MIGUEL DE CHACCRAMPA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (273, N'SANTA MARIA DE CHICMO', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (274, N'TALAVERA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (275, N'TUMAY HUARACA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (276, N'TURPO', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (277, N'KAQUIABAMBA', 29)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (278, N'ANTABAMBA', 30)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (279, N'EL ORO', 30)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (280, N'HUAQUIRCA', 30)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (281, N'JUAN ESPINOZA MEDRANO', 30)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (282, N'OROPESA', 30)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (283, N'PACHACONAS', 30)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (284, N'SABAINO', 30)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (285, N'CHALHUANCA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (286, N'CAPAYA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (287, N'CARAYBAMBA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (288, N'CHAPIMARCA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (289, N'COLCABAMBA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (290, N'COTARUSE', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (291, N'HUAYLLO', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (292, N'JUSTO APU SAHUARAURA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (293, N'LUCRE', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (294, N'POCOHUANCA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (295, N'SAN JUAN DE CHAC&Ntilde;A', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (296, N'SA&Ntilde;AYCA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (297, N'SORAYA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (298, N'TAPAIRIHUA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (299, N'TINTAY', 31)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (300, N'TORAYA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (301, N'YANACA', 31)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (302, N'TAMBOBAMBA', 32)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (303, N'COTABAMBAS', 32)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (304, N'COYLLURQUI', 32)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (305, N'HAQUIRA', 32)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (306, N'MARA', 32)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (307, N'CHALLHUAHUACHO', 32)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (308, N'CHINCHEROS', 33)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (309, N'ANCO-HUALLO', 33)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (310, N'COCHARCAS', 33)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (311, N'HUACCANA', 33)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (312, N'OCOBAMBA', 33)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (313, N'ONGOY', 33)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (314, N'URANMARCA', 33)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (315, N'RANRACANCHA', 33)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (316, N'CHUQUIBAMBILLA', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (317, N'CURPAHUASI', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (318, N'GAMARRA', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (319, N'HUAYLLATI', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (320, N'MAMARA', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (321, N'MICAELA BASTIDAS', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (322, N'PATAYPAMPA', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (323, N'PROGRESO', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (324, N'SAN ANTONIO', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (325, N'SANTA ROSA', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (326, N'TURPAY', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (327, N'VILCABAMBA', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (328, N'VIRUNDO', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (329, N'CURASCO', 34)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (330, N'AREQUIPA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (331, N'ALTO SELVA ALEGRE', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (332, N'CAYMA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (333, N'CERRO COLORADO', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (334, N'CHARACATO', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (335, N'CHIGUATA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (336, N'JACOBO HUNTER', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (337, N'LA JOYA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (338, N'MARIANO MELGAR', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (339, N'MIRAFLORES', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (340, N'MOLLEBAYA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (341, N'PAUCARPATA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (342, N'POCSI', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (343, N'POLOBAYA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (344, N'QUEQUE&Ntilde;A', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (345, N'SABANDIA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (346, N'SACHACA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (347, N'SAN JUAN DE SIGUAS', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (348, N'SAN JUAN DE TARUCANI', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (349, N'SANTA ISABEL DE SIGUAS', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (350, N'SANTA RITA DE SIGUAS', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (351, N'SOCABAYA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (352, N'TIABAYA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (353, N'UCHUMAYO', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (354, N'VITOR', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (355, N'YANAHUARA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (356, N'YARABAMBA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (357, N'YURA', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (358, N'JOSE LUIS BUSTAMANTE Y RIVERO', 35)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (359, N'CAMANA', 36)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (360, N'JOSE MARIA QUIMPER', 36)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (361, N'MARIANO NICOLAS VALCARCEL', 36)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (362, N'MARISCAL CACERES', 36)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (363, N'NICOLAS DE PIEROLA', 36)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (364, N'OCO&Ntilde;A', 36)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (365, N'QUILCA', 36)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (366, N'SAMUEL PASTOR', 36)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (367, N'CARAVELI', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (368, N'ACARI', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (369, N'ATICO', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (370, N'ATIQUIPA', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (371, N'BELLA UNION', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (372, N'CAHUACHO', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (373, N'CHALA', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (374, N'CHAPARRA', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (375, N'HUANUHUANU', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (376, N'JAQUI', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (377, N'LOMAS', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (378, N'QUICACHA', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (379, N'YAUCA', 37)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (380, N'APLAO', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (381, N'ANDAGUA', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (382, N'AYO', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (383, N'CHACHAS', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (384, N'CHILCAYMARCA', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (385, N'CHOCO', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (386, N'HUANCARQUI', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (387, N'MACHAGUAY', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (388, N'ORCOPAMPA', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (389, N'PAMPACOLCA', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (390, N'TIPAN', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (391, N'U&Ntilde;ON', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (392, N'URACA', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (393, N'VIRACO', 38)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (394, N'CHIVAY', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (395, N'ACHOMA', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (396, N'CABANACONDE', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (397, N'CALLALLI', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (398, N'CAYLLOMA', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (399, N'COPORAQUE', 39)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (400, N'HUAMBO', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (401, N'HUANCA', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (402, N'ICHUPAMPA', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (403, N'LARI', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (404, N'LLUTA', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (405, N'MACA', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (406, N'MADRIGAL', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (407, N'SAN ANTONIO DE CHUCA', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (408, N'SIBAYO', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (409, N'TAPAY', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (410, N'TISCO', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (411, N'TUTI', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (412, N'YANQUE', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (413, N'MAJES', 39)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (414, N'CHUQUIBAMBA', 40)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (415, N'ANDARAY', 40)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (416, N'CAYARANI', 40)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (417, N'CHICHAS', 40)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (418, N'IRAY', 40)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (419, N'RIO GRANDE', 40)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (420, N'SALAMANCA', 40)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (421, N'YANAQUIHUA', 40)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (422, N'MOLLENDO', 41)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (423, N'COCACHACRA', 41)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (424, N'DEAN VALDIVIA', 41)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (425, N'ISLAY', 41)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (426, N'MEJIA', 41)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (427, N'PUNTA DE BOMBON', 41)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (428, N'COTAHUASI', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (429, N'ALCA', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (430, N'CHARCANA', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (431, N'HUAYNACOTAS', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (432, N'PAMPAMARCA', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (433, N'PUYCA', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (434, N'QUECHUALLA', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (435, N'SAYLA', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (436, N'TAURIA', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (437, N'TOMEPAMPA', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (438, N'TORO', 42)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (439, N'AYACUCHO', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (440, N'ACOCRO', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (441, N'ACOS VINCHOS', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (442, N'CARMEN ALTO', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (443, N'CHIARA', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (444, N'OCROS', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (445, N'PACAYCASA', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (446, N'QUINUA', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (447, N'SAN JOSE DE TICLLAS', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (448, N'SAN JUAN BAUTISTA', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (449, N'SANTIAGO DE PISCHA', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (450, N'SOCOS', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (451, N'TAMBILLO', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (452, N'VINCHOS', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (453, N'JESUS NAZARENO', 43)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (454, N'CANGALLO', 44)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (455, N'CHUSCHI', 44)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (456, N'LOS MOROCHUCOS', 44)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (457, N'MARIA PARADO DE BELLIDO', 44)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (458, N'PARAS', 44)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (459, N'TOTOS', 44)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (460, N'SANCOS', 45)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (461, N'CARAPO', 45)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (462, N'SACSAMARCA', 45)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (463, N'SANTIAGO DE LUCANAMARCA', 45)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (464, N'HUANTA', 46)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (465, N'AYAHUANCO', 46)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (466, N'HUAMANGUILLA', 46)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (467, N'IGUAIN', 46)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (468, N'LURICOCHA', 46)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (469, N'SANTILLANA', 46)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (470, N'SIVIA', 46)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (471, N'LLOCHEGUA', 46)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (472, N'SAN MIGUEL', 47)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (473, N'ANCO', 47)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (474, N'AYNA', 47)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (475, N'CHILCAS', 47)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (476, N'CHUNGUI', 47)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (477, N'LUIS CARRANZA', 47)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (478, N'SANTA ROSA', 47)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (479, N'TAMBO', 47)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (480, N'PUQUIO', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (481, N'AUCARA', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (482, N'CABANA', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (483, N'CARMEN SALCEDO', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (484, N'CHAVI&Ntilde;A', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (485, N'CHIPAO', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (486, N'HUAC-HUAS', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (487, N'LARAMATE', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (488, N'LEONCIO PRADO', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (489, N'LLAUTA', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (490, N'LUCANAS', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (491, N'OCA&Ntilde;A', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (492, N'OTOCA', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (493, N'SAISA', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (494, N'SAN CRISTOBAL', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (495, N'SAN JUAN', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (496, N'SAN PEDRO', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (497, N'SAN PEDRO DE PALCO', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (498, N'SANCOS', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (499, N'SANTA ANA DE HUAYCAHUACHO', 48)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (500, N'SANTA LUCIA', 48)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (501, N'CORACORA', 49)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (502, N'CHUMPI', 49)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (503, N'CORONEL CASTA&Ntilde;EDA', 49)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (504, N'PACAPAUSA', 49)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (505, N'PULLO', 49)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (506, N'PUYUSCA', 49)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (507, N'SAN FRANCISCO DE RAVACAYCO', 49)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (508, N'UPAHUACHO', 49)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (509, N'PAUSA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (510, N'COLTA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (511, N'CORCULLA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (512, N'LAMPA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (513, N'MARCABAMBA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (514, N'OYOLO', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (515, N'PARARCA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (516, N'SAN JAVIER DE ALPABAMBA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (517, N'SAN JOSE DE USHUA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (518, N'SARA SARA', 50)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (519, N'QUEROBAMBA', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (520, N'BELEN', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (521, N'CHALCOS', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (522, N'CHILCAYOC', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (523, N'HUACA&Ntilde;A', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (524, N'MORCOLLA', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (525, N'PAICO', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (526, N'SAN PEDRO DE LARCAY', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (527, N'SAN SALVADOR DE QUIJE', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (528, N'SANTIAGO DE PAUCARAY', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (529, N'SORAS', 51)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (530, N'HUANCAPI', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (531, N'ALCAMENCA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (532, N'APONGO', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (533, N'ASQUIPATA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (534, N'CANARIA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (535, N'CAYARA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (536, N'COLCA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (537, N'HUAMANQUIQUIA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (538, N'HUANCARAYLLA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (539, N'HUAYA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (540, N'SARHUA', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (541, N'VILCANCHOS', 52)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (542, N'VILCAS HUAMAN', 53)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (543, N'ACCOMARCA', 53)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (544, N'CARHUANCA', 53)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (545, N'CONCEPCION', 53)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (546, N'HUAMBALPA', 53)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (547, N'INDEPENDENCIA', 53)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (548, N'SAURAMA', 53)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (549, N'VISCHONGO', 53)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (550, N'CAJAMARCA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (551, N'CAJAMARCA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (552, N'ASUNCION', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (553, N'CHETILLA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (554, N'COSPAN', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (555, N'ENCA&Ntilde;ADA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (556, N'JESUS', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (557, N'LLACANORA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (558, N'LOS BA&Ntilde;OS DEL INCA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (559, N'MAGDALENA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (560, N'MATARA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (561, N'NAMORA', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (562, N'SAN JUAN', 54)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (563, N'CAJABAMBA', 55)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (564, N'CACHACHI', 55)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (565, N'CONDEBAMBA', 55)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (566, N'SITACOCHA', 55)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (567, N'CELENDIN', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (568, N'CHUMUCH', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (569, N'CORTEGANA', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (570, N'HUASMIN', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (571, N'JORGE CHAVEZ', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (572, N'JOSE GALVEZ', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (573, N'MIGUEL IGLESIAS', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (574, N'OXAMARCA', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (575, N'SOROCHUCO', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (576, N'SUCRE', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (577, N'UTCO', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (578, N'LA LIBERTAD DE PALLAN', 56)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (579, N'CHOTA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (580, N'ANGUIA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (581, N'CHADIN', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (582, N'CHIGUIRIP', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (583, N'CHIMBAN', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (584, N'CHOROPAMPA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (585, N'COCHABAMBA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (586, N'CONCHAN', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (587, N'HUAMBOS', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (588, N'LAJAS', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (589, N'LLAMA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (590, N'MIRACOSTA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (591, N'PACCHA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (592, N'PION', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (593, N'QUEROCOTO', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (594, N'SAN JUAN DE LICUPIS', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (595, N'TACABAMBA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (596, N'TOCMOCHE', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (597, N'CHALAMARCA', 57)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (598, N'CONTUMAZA', 58)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (599, N'CHILETE', 58)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (600, N'CUPISNIQUE', 58)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (601, N'GUZMANGO', 58)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (602, N'SAN BENITO', 58)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (603, N'SANTA CRUZ DE TOLED', 58)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (604, N'TANTARICA', 58)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (605, N'YONAN', 58)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (606, N'CUTERVO', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (607, N'CALLAYUC', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (608, N'CHOROS', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (609, N'CUJILLO', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (610, N'LA RAMADA', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (611, N'PIMPINGOS', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (612, N'QUEROCOTILLO', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (613, N'SAN ANDRES DE CUTERVO', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (614, N'SAN JUAN DE CUTERVO', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (615, N'SAN LUIS DE LUCMA', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (616, N'SANTA CRUZ', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (617, N'SANTO DOMINGO DE LA CAPILLA', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (618, N'SANTO TOMAS', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (619, N'SOCOTA', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (620, N'TORIBIO CASANOVA', 59)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (621, N'BAMBAMARCA', 60)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (622, N'CHUGUR', 60)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (623, N'HUALGAYOC', 60)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (624, N'JAEN', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (625, N'BELLAVISTA', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (626, N'CHONTALI', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (627, N'COLASAY', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (628, N'HUABAL', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (629, N'LAS PIRIAS', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (630, N'POMAHUACA', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (631, N'PUCARA', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (632, N'SALLIQUE', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (633, N'SAN FELIPE', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (634, N'SAN JOSE DEL ALTO', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (635, N'SANTA ROSA', 61)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (636, N'SAN IGNACIO', 62)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (637, N'CHIRINOS', 62)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (638, N'HUARANGO', 62)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (639, N'LA COIPA', 62)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (640, N'NAMBALLE', 62)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (641, N'SAN JOSE DE LOURDES', 62)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (642, N'TABACONAS', 62)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (643, N'PEDRO GALVEZ', 63)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (644, N'CHANCAY', 63)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (645, N'EDUARDO VILLANUEVA', 63)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (646, N'GREGORIO PITA', 63)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (647, N'ICHOCAN', 63)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (648, N'JOSE MANUEL QUIROZ', 63)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (649, N'JOSE SABOGAL', 63)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (650, N'SAN MIGUEL', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (651, N'SAN MIGUEL', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (652, N'BOLIVAR', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (653, N'CALQUIS', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (654, N'CATILLUC', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (655, N'EL PRADO', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (656, N'LA FLORIDA', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (657, N'LLAPA', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (658, N'NANCHOC', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (659, N'NIEPOS', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (660, N'SAN GREGORIO', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (661, N'SAN SILVESTRE DE COCHAN', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (662, N'TONGOD', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (663, N'UNION AGUA BLANCA', 64)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (664, N'SAN PABLO', 65)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (665, N'SAN BERNARDINO', 65)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (666, N'SAN LUIS', 65)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (667, N'TUMBADEN', 65)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (668, N'SANTA CRUZ', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (669, N'ANDABAMBA', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (670, N'CATACHE', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (671, N'CHANCAYBA&Ntilde;OS', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (672, N'LA ESPERANZA', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (673, N'NINABAMBA', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (674, N'PULAN', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (675, N'SAUCEPAMPA', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (676, N'SEXI', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (677, N'UTICYACU', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (678, N'YAUYUCAN', 66)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (679, N'CALLAO', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (680, N'BELLAVISTA', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (681, N'CARMEN DE LA LEGUA REYNOSO', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (682, N'LA PERLA', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (683, N'LA PUNTA', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (684, N'VENTANILLA', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (685, N'CUSCO', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (686, N'CCORCA', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (687, N'POROY', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (688, N'SAN JERONIMO', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (689, N'SAN SEBASTIAN', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (690, N'SANTIAGO', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (691, N'SAYLLA', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (692, N'WANCHAQ', 67)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (693, N'ACOMAYO', 68)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (694, N'ACOPIA', 68)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (695, N'ACOS', 68)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (696, N'MOSOC LLACTA', 68)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (697, N'POMACANCHI', 68)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (698, N'RONDOCAN', 68)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (699, N'SANGARARA', 68)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (700, N'ANTA', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (701, N'ANCAHUASI', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (702, N'CACHIMAYO', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (703, N'CHINCHAYPUJIO', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (704, N'HUAROCONDO', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (705, N'LIMATAMBO', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (706, N'MOLLEPATA', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (707, N'PUCYURA', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (708, N'ZURITE', 69)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (709, N'CALCA', 70)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (710, N'COYA', 70)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (711, N'LAMAY', 70)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (712, N'LARES', 70)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (713, N'PISAC', 70)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (714, N'SAN SALVADOR', 70)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (715, N'TARAY', 70)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (716, N'YANATILE', 70)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (717, N'YANAOCA', 71)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (718, N'CHECCA', 71)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (719, N'KUNTURKANKI', 71)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (720, N'LANGUI', 71)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (721, N'LAYO', 71)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (722, N'PAMPAMARCA', 71)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (723, N'QUEHUE', 71)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (724, N'TUPAC AMARU', 71)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (725, N'SICUANI', 72)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (726, N'CHECACUPE', 72)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (727, N'COMBAPATA', 72)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (728, N'MARANGANI', 72)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (729, N'PITUMARCA', 72)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (730, N'SAN PABLO', 72)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (731, N'SAN PEDRO', 72)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (732, N'TINTA', 72)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (733, N'SANTO TOMAS', 73)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (734, N'CAPACMARCA', 73)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (735, N'CHAMACA', 73)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (736, N'COLQUEMARCA', 73)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (737, N'LIVITACA', 73)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (738, N'LLUSCO', 73)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (739, N'QUI&Ntilde;OTA', 73)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (740, N'VELILLE', 73)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (741, N'ESPINAR', 74)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (742, N'CONDOROMA', 74)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (743, N'COPORAQUE', 74)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (744, N'OCORURO', 74)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (745, N'PALLPATA', 74)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (746, N'PICHIGUA', 74)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (747, N'SUYCKUTAMBO', 74)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (748, N'ALTO PICHIGUA', 74)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (749, N'SANTA ANA', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (750, N'ECHARATE', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (751, N'HUAYOPATA', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (752, N'MARANURA', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (753, N'OCOBAMBA', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (754, N'QUELLOUNO', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (755, N'KIMBIRI', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (756, N'SANTA TERESA', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (757, N'VILCABAMBA', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (758, N'PICHARI', 75)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (759, N'PARURO', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (760, N'ACCHA', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (761, N'CCAPI', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (762, N'COLCHA', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (763, N'HUANOQUITE', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (764, N'OMACHA', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (765, N'PACCARITAMBO', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (766, N'PILLPINTO', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (767, N'YAURISQUE', 76)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (768, N'PAUCARTAMBO', 77)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (769, N'CAICAY', 77)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (770, N'CHALLABAMBA', 77)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (771, N'COLQUEPATA', 77)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (772, N'HUANCARANI', 77)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (773, N'KOS&Ntilde;IPATA', 77)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (774, N'URCOS', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (775, N'ANDAHUAYLILLAS', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (776, N'CAMANTI', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (777, N'CCARHUAYO', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (778, N'CCATCA', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (779, N'CUSIPATA', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (780, N'HUARO', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (781, N'LUCRE', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (782, N'MARCAPATA', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (783, N'OCONGATE', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (784, N'OROPESA', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (785, N'QUIQUIJANA', 78)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (786, N'URUBAMBA', 79)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (787, N'CHINCHERO', 79)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (788, N'HUAYLLABAMBA', 79)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (789, N'MACHUPICCHU', 79)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (790, N'MARAS', 79)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (791, N'OLLANTAYTAMBO', 79)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (792, N'YUCAY', 79)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (793, N'HUANCAVELICA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (794, N'ACOBAMBILLA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (795, N'ACORIA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (796, N'CONAYCA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (797, N'CUENCA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (798, N'HUACHOCOLPA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (799, N'HUAYLLAHUARA', 80)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (800, N'IZCUCHACA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (801, N'LARIA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (802, N'MANTA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (803, N'MARISCAL CACERES', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (804, N'MOYA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (805, N'NUEVO OCCORO', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (806, N'PALCA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (807, N'PILCHACA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (808, N'VILCA', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (809, N'YAULI', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (810, N'ASCENSION', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (811, N'HUANDO', 80)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (812, N'ACOBAMBA', 81)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (813, N'ANDABAMBA', 81)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (814, N'ANTA', 81)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (815, N'CAJA', 81)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (816, N'MARCAS', 81)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (817, N'PAUCARA', 81)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (818, N'POMACOCHA', 81)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (819, N'ROSARIO', 81)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (820, N'LIRCAY', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (821, N'ANCHONGA', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (822, N'CALLANMARCA', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (823, N'CCOCHACCASA', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (824, N'CHINCHO', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (825, N'CONGALLA', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (826, N'HUANCA-HUANCA', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (827, N'HUAYLLAY GRANDE', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (828, N'JULCAMARCA', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (829, N'SAN ANTONIO DE ANTAPARCO', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (830, N'SANTO TOMAS DE PATA', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (831, N'SECCLLA', 82)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (832, N'CASTROVIRREYNA', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (833, N'ARMA', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (834, N'AURAHUA', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (835, N'CAPILLAS', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (836, N'CHUPAMARCA', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (837, N'COCAS', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (838, N'HUACHOS', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (839, N'HUAMATAMBO', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (840, N'MOLLEPAMPA', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (841, N'SAN JUAN', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (842, N'SANTA ANA', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (843, N'TANTARA', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (844, N'TICRAPO', 83)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (845, N'CHURCAMPA', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (846, N'ANCO', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (847, N'CHINCHIHUASI', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (848, N'EL CARMEN', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (849, N'LA MERCED', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (850, N'LOCROJA', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (851, N'PAUCARBAMBA', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (852, N'SAN MIGUEL DE MAYOCC', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (853, N'SAN PEDRO DE CORIS', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (854, N'PACHAMARCA', 84)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (855, N'HUAYTARA', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (856, N'AYAVI', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (857, N'CORDOVA', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (858, N'HUAYACUNDO ARMA', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (859, N'LARAMARCA', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (860, N'OCOYO', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (861, N'PILPICHACA', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (862, N'QUERCO', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (863, N'QUITO-ARMA', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (864, N'SAN ANTONIO DE CUSICANCHA', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (865, N'SAN FRANCISCO DE SANGAYAICO', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (866, N'SAN ISIDRO', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (867, N'SANTIAGO DE CHOCORVOS', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (868, N'SANTIAGO DE QUIRAHUARA', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (869, N'SANTO DOMINGO DE CAPILLAS', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (870, N'TAMBO', 85)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (871, N'PAMPAS', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (872, N'ACOSTAMBO', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (873, N'ACRAQUIA', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (874, N'AHUAYCHA', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (875, N'COLCABAMBA', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (876, N'DANIEL HERNANDEZ', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (877, N'HUACHOCOLPA', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (878, N'HUARIBAMBA', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (879, N'&Ntilde;AHUIMPUQUIO', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (880, N'PAZOS', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (881, N'QUISHUAR', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (882, N'SALCABAMBA', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (883, N'SALCAHUASI', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (884, N'SAN MARCOS DE ROCCHAC', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (885, N'SURCUBAMBA', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (886, N'TINTAY PUNCU', 86)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (887, N'HUANUCO', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (888, N'AMARILIS', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (889, N'CHINCHAO', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (890, N'CHURUBAMBA', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (891, N'MARGOS', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (892, N'QUISQUI', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (893, N'SAN FRANCISCO DE CAYRAN', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (894, N'SAN PEDRO DE CHAULAN', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (895, N'SANTA MARIA DEL VALLE', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (896, N'YARUMAYO', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (897, N'PILLCO MARCA', 87)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (898, N'AMBO', 88)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (899, N'CAYNA', 88)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (900, N'COLPAS', 88)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (901, N'CONCHAMARCA', 88)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (902, N'HUACAR', 88)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (903, N'SAN FRANCISCO', 88)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (904, N'SAN RAFAEL', 88)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (905, N'TOMAY KICHWA', 88)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (906, N'LA UNION', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (907, N'CHUQUIS', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (908, N'MARIAS', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (909, N'PACHAS', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (910, N'QUIVILLA', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (911, N'RIPAN', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (912, N'SHUNQUI', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (913, N'SILLAPATA', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (914, N'YANAS', 89)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (915, N'HUACAYBAMBA', 90)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (916, N'CANCHABAMBA', 90)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (917, N'COCHABAMBA', 90)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (918, N'PINRA', 90)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (919, N'LLATA', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (920, N'ARANCAY', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (921, N'CHAVIN DE PARIARCA', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (922, N'JACAS GRANDE', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (923, N'JIRCAN', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (924, N'MIRAFLORES', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (925, N'MONZON', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (926, N'PUNCHAO', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (927, N'PU&Ntilde;OS', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (928, N'SINGA', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (929, N'TANTAMAYO', 91)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (930, N'RUPA-RUPA', 92)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (931, N'DANIEL ALOMIA ROBLES', 92)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (932, N'HERMILIO VALDIZAN', 92)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (933, N'JOSE CRESPO Y CASTILLO', 92)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (934, N'LUYANDO', 92)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (935, N'MARIANO DAMASO BERAUN', 92)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (936, N'HUACRACHUCO', 93)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (937, N'CHOLON', 93)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (938, N'SAN BUENAVENTURA', 93)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (939, N'PANAO', 94)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (940, N'CHAGLLA', 94)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (941, N'MOLINO', 94)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (942, N'UMARI', 94)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (943, N'PUERTO INCA', 95)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (944, N'CODO DEL POZUZO', 95)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (945, N'HONORIA', 95)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (946, N'TOURNAVISTA', 95)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (947, N'YUYAPICHIS', 95)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (948, N'JESUS', 96)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (949, N'BA&Ntilde;OS', 96)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (950, N'JIVIA', 96)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (951, N'QUEROPALCA', 96)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (952, N'RONDOS', 96)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (953, N'SAN FRANCISCO DE ASIS', 96)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (954, N'SAN MIGUEL DE CAURI', 96)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (955, N'CHAVINILLO', 97)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (956, N'CAHUAC', 97)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (957, N'CHACABAMBA', 97)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (958, N'APARICIO POMARES', 97)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (959, N'JACAS CHICO', 97)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (960, N'OBAS', 97)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (961, N'PAMPAMARCA', 97)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (962, N'CHORAS', 97)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (963, N'ICA', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (964, N'LA TINGUI&Ntilde;A', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (965, N'LOS AQUIJES', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (966, N'OCUCAJE', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (967, N'PACHACUTEC', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (968, N'PARCONA', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (969, N'PUEBLO NUEVO', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (970, N'SALAS', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (971, N'SAN JOSE DE LOS MOLINOS', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (972, N'SAN JUAN BAUTISTA', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (973, N'SANTIAGO', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (974, N'SUBTANJALLA', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (975, N'TATE', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (976, N'YAUCA DEL ROSARIO', 98)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (977, N'CHINCHA ALTA', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (978, N'ALTO LARAN', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (979, N'CHAVIN', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (980, N'CHINCHA BAJA', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (981, N'EL CARMEN', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (982, N'GROCIO PRADO', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (983, N'PUEBLO NUEVO', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (984, N'SAN JUAN DE YANAC', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (985, N'SAN PEDRO DE HUACARPANA', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (986, N'SUNAMPE', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (987, N'TAMBO DE MORA', 99)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (988, N'NAZCA', 100)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (989, N'CHANGUILLO', 100)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (990, N'EL INGENIO', 100)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (991, N'MARCONA', 100)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (992, N'VISTA ALEGRE', 100)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (993, N'PALPA', 101)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (994, N'LLIPATA', 101)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (995, N'RIO GRANDE', 101)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (996, N'SANTA CRUZ', 101)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (997, N'TIBILLO', 101)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (998, N'PISCO', 102)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (999, N'HUANCANO', 102)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1000, N'HUMAY', 102)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1001, N'INDEPENDENCIA', 102)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1002, N'PARACAS', 102)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1003, N'SAN ANDRES', 102)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1004, N'SAN CLEMENTE', 102)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1005, N'TUPAC AMARU INCA', 102)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1006, N'HUANCAYO', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1007, N'CARHUACALLANGA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1008, N'CHACAPAMPA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1009, N'CHICCHE', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1010, N'CHILCA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1011, N'CHONGOS ALTO', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1012, N'CHUPURO', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1013, N'COLCA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1014, N'CULLHUAS', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1015, N'EL TAMBO', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1016, N'HUACRAPUQUIO', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1017, N'HUALHUAS', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1018, N'HUANCAN', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1019, N'HUASICANCHA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1020, N'HUAYUCACHI', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1021, N'INGENIO', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1022, N'PARIAHUANCA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1023, N'PILCOMAYO', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1024, N'PUCARA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1025, N'QUICHUAY', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1026, N'QUILCAS', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1027, N'SAN AGUSTIN', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1028, N'SAN JERONIMO DE TUNAN', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1029, N'SA&Ntilde;O', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1030, N'SAPALLANGA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1031, N'SICAYA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1032, N'SANTO DOMINGO DE ACOBAMBA', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1033, N'VIQUES', 103)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1034, N'CONCEPCION', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1035, N'ACO', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1036, N'ANDAMARCA', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1037, N'CHAMBARA', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1038, N'COCHAS', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1039, N'COMAS', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1040, N'HEROINAS TOLEDO', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1041, N'MANZANARES', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1042, N'MARISCAL CASTILLA', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1043, N'MATAHUASI', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1044, N'MITO', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1045, N'NUEVE DE JULIO', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1046, N'ORCOTUNA', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1047, N'SAN JOSE DE QUERO', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1048, N'SANTA ROSA DE OCOPA', 104)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1049, N'CHANCHAMAYO', 105)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1050, N'PERENE', 105)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1051, N'PICHANAQUI', 105)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1052, N'SAN LUIS DE SHUARO', 105)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1053, N'SAN RAMON', 105)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1054, N'VITOC', 105)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1055, N'JAUJA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1056, N'ACOLLA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1057, N'APATA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1058, N'ATAURA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1059, N'CANCHAYLLO', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1060, N'CURICACA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1061, N'EL MANTARO', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1062, N'HUAMALI', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1063, N'HUARIPAMPA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1064, N'HUERTAS', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1065, N'JANJAILLO', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1066, N'JULCAN', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1067, N'LEONOR ORDO&Ntilde;EZ', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1068, N'LLOCLLAPAMPA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1069, N'MARCO', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1070, N'MASMA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1071, N'MASMA CHICCHE', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1072, N'MOLINOS', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1073, N'MONOBAMBA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1074, N'MUQUI', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1075, N'MUQUIYAUYO', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1076, N'PACA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1077, N'PACCHA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1078, N'PANCAN', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1079, N'PARCO', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1080, N'POMACANCHA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1081, N'RICRAN', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1082, N'SAN LORENZO', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1083, N'SAN PEDRO DE CHUNAN', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1084, N'SAUSA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1085, N'SINCOS', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1086, N'TUNAN MARCA', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1087, N'YAULI', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1088, N'YAUYOS', 106)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1089, N'JUNIN', 107)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1090, N'CARHUAMAYO', 107)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1091, N'ONDORES', 107)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1092, N'ULCUMAYO', 107)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1093, N'SATIPO', 108)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1094, N'COVIRIALI', 108)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1095, N'LLAYLLA', 108)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1096, N'MAZAMARI', 108)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1097, N'PAMPA HERMOSA', 108)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1098, N'PANGOA', 108)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1099, N'RIO NEGRO', 108)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1100, N'RIO TAMBO', 108)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1101, N'TARMA', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1102, N'ACOBAMBA', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1103, N'HUARICOLCA', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1104, N'HUASAHUASI', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1105, N'LA UNION', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1106, N'PALCA', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1107, N'PALCAMAYO', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1108, N'SAN PEDRO DE CAJAS', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1109, N'TAPO', 109)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1110, N'LA OROYA', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1111, N'CHACAPALPA', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1112, N'HUAY-HUAY', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1113, N'MARCAPOMACOCHA', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1114, N'MOROCOCHA', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1115, N'PACCHA', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1116, N'SANTA BARBARA DE CARHUACAYAN', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1117, N'SANTA ROSA DE SACCO', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1118, N'SUITUCANCHA', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1119, N'YAULI', 110)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1120, N'CHUPACA', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1121, N'AHUAC', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1122, N'CHONGOS BAJO', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1123, N'HUACHAC', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1124, N'HUAMANCACA CHICO', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1125, N'SAN JUAN DE ISCOS', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1126, N'SAN JUAN DE JARPA', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1127, N'TRES DE DICIEMBRE', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1128, N'YANACANCHA', 111)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1129, N'TRUJILLO', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1130, N'EL PORVENIR', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1131, N'FLORENCIA DE MORA', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1132, N'HUANCHACO', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1133, N'LA ESPERANZA', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1134, N'LAREDO', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1135, N'MOCHE', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1136, N'POROTO', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1137, N'SALAVERRY', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1138, N'SIMBAL', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1139, N'VICTOR LARCO HERRERA', 112)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1140, N'ASCOPE', 113)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1141, N'CHICAMA', 113)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1142, N'CHOCOPE', 113)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1143, N'MAGDALENA DE CAO', 113)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1144, N'PAIJAN', 113)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1145, N'RAZURI', 113)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1146, N'SANTIAGO DE CAO', 113)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1147, N'CASA GRANDE', 113)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1148, N'BOLIVAR', 114)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1149, N'BAMBAMARCA', 114)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1150, N'CONDORMARCA', 114)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1151, N'LONGOTEA', 114)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1152, N'UCHUMARCA', 114)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1153, N'UCUNCHA', 114)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1154, N'CHEPEN', 115)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1155, N'PACANGA', 115)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1156, N'PUEBLO NUEVO', 115)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1157, N'JULCAN', 116)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1158, N'CALAMARCA', 116)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1159, N'CARABAMBA', 116)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1160, N'HUASO', 116)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1161, N'OTUZCO', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1162, N'AGALLPAMPA', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1163, N'CHARAT', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1164, N'HUARANCHAL', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1165, N'LA CUESTA', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1166, N'MACHE', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1167, N'PARANDAY', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1168, N'SALPO', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1169, N'SINSICAP', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1170, N'USQUIL', 117)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1171, N'SAN PEDRO DE LLOC', 118)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1172, N'GUADALUPE', 118)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1173, N'JEQUETEPEQUE', 118)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1174, N'PACASMAYO', 118)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1175, N'SAN JOSE', 118)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1176, N'TAYABAMBA', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1177, N'BULDIBUYO', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1178, N'CHILLIA', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1179, N'HUANCASPATA', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1180, N'HUAYLILLAS', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1181, N'HUAYO', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1182, N'ONGON', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1183, N'PARCOY', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1184, N'PATAZ', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1185, N'PIAS', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1186, N'SANTIAGO DE CHALLAS', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1187, N'TAURIJA', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1188, N'URPAY', 119)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1189, N'HUAMACHUCO', 120)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1190, N'CHUGAY', 120)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1191, N'COCHORCO', 120)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1192, N'CURGOS', 120)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1193, N'MARCABAL', 120)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1194, N'SANAGORAN', 120)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1195, N'SARIN', 120)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1196, N'SARTIMBAMBA', 120)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1197, N'SANTIAGO DE CHUCO', 121)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1198, N'ANGASMARCA', 121)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1199, N'CACHICADAN', 121)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1200, N'MOLLEBAMBA', 121)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1201, N'MOLLEPATA', 121)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1202, N'QUIRUVILCA', 121)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1203, N'SANTA CRUZ DE CHUCA', 121)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1204, N'SITABAMBA', 121)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1205, N'GRAN CHIMU', 122)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1206, N'CASCAS', 122)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1207, N'LUCMA', 122)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1208, N'MARMOT', 122)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1209, N'SAYAPULLO', 122)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1210, N'VIRU', 123)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1211, N'CHAO', 123)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1212, N'GUADALUPITO', 123)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1213, N'CHICLAYO', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1214, N'CHONGOYAPE', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1215, N'ETEN', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1216, N'ETEN PUERTO', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1217, N'JOSE LEONARDO ORTIZ', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1218, N'LA VICTORIA', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1219, N'LAGUNAS', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1220, N'MONSEFU', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1221, N'NUEVA ARICA', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1222, N'OYOTUN', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1223, N'PICSI', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1224, N'PIMENTEL', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1225, N'REQUE', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1226, N'SANTA ROSA', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1227, N'SA&Ntilde;A', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1228, N'CAYALTI', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1229, N'PATAPO', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1230, N'POMALCA', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1231, N'PUCALA', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1232, N'TUMAN', 124)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1233, N'FERRE&Ntilde;AFE', 125)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1234, N'CA&Ntilde;ARIS', 125)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1235, N'INCAHUASI', 125)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1236, N'MANUEL ANTONIO MESONES MURO', 125)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1237, N'PITIPO', 125)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1238, N'PUEBLO NUEVO', 125)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1239, N'LAMBAYEQUE', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1240, N'CHOCHOPE', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1241, N'ILLIMO', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1242, N'JAYANCA', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1243, N'MOCHUMI', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1244, N'MORROPE', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1245, N'MOTUPE', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1246, N'OLMOS', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1247, N'PACORA', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1248, N'SALAS', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1249, N'SAN JOSE', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1250, N'TUCUME', 126)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1251, N'LIMA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1252, N'ANCON', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1253, N'ATE', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1254, N'BARRANCO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1255, N'BRE&Ntilde;A', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1256, N'CARABAYLLO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1257, N'CHACLACAYO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1258, N'CHORRILLOS', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1259, N'CIENEGUILLA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1260, N'COMAS', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1261, N'EL AGUSTINO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1262, N'INDEPENDENCIA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1263, N'JESUS MARIA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1264, N'LA MOLINA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1265, N'LA VICTORIA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1266, N'LINCE', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1267, N'LOS OLIVOS', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1268, N'LURIGANCHO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1269, N'LURIN', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1270, N'MAGDALENA DEL MAR', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1271, N'MAGDALENA VIEJA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1272, N'MIRAFLORES', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1273, N'PACHACAMAC', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1274, N'PUCUSANA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1275, N'PUENTE PIEDRA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1276, N'PUNTA HERMOSA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1277, N'PUNTA NEGRA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1278, N'RIMAC', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1279, N'SAN BARTOLO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1280, N'SAN BORJA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1281, N'SAN ISIDRO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1282, N'SAN JUAN DE LURIGANCHO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1283, N'SAN JUAN DE MIRAFLORES', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1284, N'SAN LUIS', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1285, N'SAN MARTIN DE PORRES', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1286, N'SAN MIGUEL', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1287, N'SANTA ANITA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1288, N'SANTA MARIA DEL MAR', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1289, N'SANTA ROSA', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1290, N'SANTIAGO DE SURCO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1291, N'SURQUILLO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1292, N'VILLA EL SALVADOR', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1293, N'VILLA MARIA DEL TRIUNFO', 127)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1294, N'BARRANCA', 128)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1295, N'PARAMONGA', 128)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1296, N'PATIVILCA', 128)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1297, N'SUPE', 128)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1298, N'SUPE PUERTO', 128)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1299, N'CAJATAMBO', 129)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1300, N'COPA', 129)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1301, N'GORGOR', 129)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1302, N'HUANCAPON', 129)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1303, N'MANAS', 129)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1304, N'CANTA', 130)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1305, N'ARAHUAY', 130)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1306, N'HUAMANTANGA', 130)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1307, N'HUAROS', 130)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1308, N'LACHAQUI', 130)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1309, N'SAN BUENAVENTURA', 130)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1310, N'SANTA ROSA DE QUIVES', 130)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1311, N'SAN VICENTE DE CA&Ntilde;ETE', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1312, N'ASIA', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1313, N'CALANGO', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1314, N'CERRO AZUL', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1315, N'CHILCA', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1316, N'COAYLLO', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1317, N'IMPERIAL', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1318, N'LUNAHUANA', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1319, N'MALA', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1320, N'NUEVO IMPERIAL', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1321, N'PACARAN', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1322, N'QUILMANA', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1323, N'SAN ANTONIO', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1324, N'SAN LUIS', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1325, N'SANTA CRUZ DE FLORES', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1326, N'ZU&Ntilde;IGA', 131)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1327, N'HUARAL', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1328, N'ATAVILLOS ALTO', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1329, N'ATAVILLOS BAJO', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1330, N'AUCALLAMA', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1331, N'CHANCAY', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1332, N'IHUARI', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1333, N'LAMPIAN', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1334, N'PACARAOS', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1335, N'SAN MIGUEL DE ACOS', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1336, N'SANTA CRUZ DE ANDAMARCA', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1337, N'SUMBILCA', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1338, N'VEINTISIETE DE NOVIEMBRE', 132)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1339, N'MATUCANA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1340, N'ANTIOQUIA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1341, N'CALLAHUANCA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1342, N'CARAMPOMA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1343, N'CHICLA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1344, N'CUENCA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1345, N'HUACHUPAMPA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1346, N'HUANZA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1347, N'HUAROCHIRI', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1348, N'LAHUAYTAMBO', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1349, N'LANGA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1350, N'LARAOS', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1351, N'MARIATANA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1352, N'RICARDO PALMA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1353, N'SAN ANDRES DE TUPICOCHA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1354, N'SAN ANTONIO', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1355, N'SAN BARTOLOME', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1356, N'SAN DAMIAN', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1357, N'SAN JUAN DE IRIS', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1358, N'SAN JUAN DE TANTARANCHE', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1359, N'SAN LORENZO DE QUINTI', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1360, N'SAN MATEO', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1361, N'SAN MATEO DE OTAO', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1362, N'SAN PEDRO DE CASTA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1363, N'SAN PEDRO DE HUANCAYRE', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1364, N'SANGALLAYA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1365, N'SANTA CRUZ DE COCACHACRA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1366, N'SANTA EULALIA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1367, N'SANTIAGO DE ANCHUCAYA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1368, N'SANTIAGO DE TUNA', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1369, N'SANTO DOMINGO DE LOS OLLEROS', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1370, N'SURCO', 133)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1371, N'HUACHO', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1372, N'AMBAR', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1373, N'CALETA DE CARQUIN', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1374, N'CHECRAS', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1375, N'HUALMAY', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1376, N'HUAURA', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1377, N'LEONCIO PRADO', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1378, N'PACCHO', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1379, N'SANTA LEONOR', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1380, N'SANTA MARIA', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1381, N'SAYAN', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1382, N'VEGUETA', 134)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1383, N'OYON', 135)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1384, N'ANDAJES', 135)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1385, N'CAUJUL', 135)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1386, N'COCHAMARCA', 135)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1387, N'NAVAN', 135)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1388, N'PACHANGARA', 135)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1389, N'YAUYOS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1390, N'ALIS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1391, N'AYAUCA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1392, N'AYAVIRI', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1393, N'AZANGARO', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1394, N'CACRA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1395, N'CARANIA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1396, N'CATAHUASI', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1397, N'CHOCOS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1398, N'COCHAS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1399, N'COLONIA', 136)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1400, N'HONGOS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1401, N'HUAMPARA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1402, N'HUANCAYA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1403, N'HUANGASCAR', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1404, N'HUANTAN', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1405, N'HUA&Ntilde;EC', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1406, N'LARAOS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1407, N'LINCHA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1408, N'MADEAN', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1409, N'MIRAFLORES', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1410, N'OMAS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1411, N'PUTINZA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1412, N'QUINCHES', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1413, N'QUINOCAY', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1414, N'SAN JOAQUIN', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1415, N'SAN PEDRO DE PILAS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1416, N'TANTA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1417, N'TAURIPAMPA', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1418, N'TOMAS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1419, N'TUPE', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1420, N'VIÑAC', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1421, N'VITIS', 136)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1422, N'IQUITOS', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1423, N'ALTO NANAY', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1424, N'FERNANDO LORES', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1425, N'INDIANA', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1426, N'LAS AMAZONAS', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1427, N'MAZAN', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1428, N'NAPO', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1429, N'PUNCHANA', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1430, N'PUTUMAYO', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1431, N'TORRES CAUSANA', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1432, N'BELEN', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1433, N'SAN JUAN BAUTISTA', 137)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1434, N'YURIMAGUAS', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1435, N'BALSAPUERTO', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1436, N'BARRANCA', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1437, N'CAHUAPANAS', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1438, N'JEBEROS', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1439, N'LAGUNAS', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1440, N'MANSERICHE', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1441, N'MORONA', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1442, N'PASTAZA', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1443, N'SANTA CRUZ', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1444, N'TENIENTE CESAR LOPEZ ROJAS', 138)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1445, N'NAUTA', 139)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1446, N'PARINARI', 139)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1447, N'TIGRE', 139)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1448, N'TROMPETEROS', 139)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1449, N'URARINAS', 139)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1450, N'RAMON CASTILLA', 140)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1451, N'PEBAS', 140)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1452, N'YAVARI', 140)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1453, N'SAN PABLO', 140)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1454, N'REQUENA', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1455, N'ALTO TAPICHE', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1456, N'CAPELO', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1457, N'EMILIO SAN MARTIN', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1458, N'MAQUIA', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1459, N'PUINAHUA', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1460, N'SAQUENA', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1461, N'SOPLIN', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1462, N'TAPICHE', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1463, N'JENARO HERRERA', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1464, N'YAQUERANA', 141)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1465, N'CONTAMANA', 142)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1466, N'INAHUAYA', 142)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1467, N'PADRE MARQUEZ', 142)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1468, N'PAMPA HERMOSA', 142)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1469, N'SARAYACU', 142)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1470, N'VARGAS GUERRA', 142)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1471, N'TAMBOPATA', 143)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1472, N'INAMBARI', 143)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1473, N'LAS PIEDRAS', 143)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1474, N'LABERINTO', 143)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1475, N'MANU', 144)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1476, N'FITZCARRALD', 144)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1477, N'MADRE DE DIOS', 144)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1478, N'HUEPETUHE', 144)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1479, N'I&Ntilde;APARI', 145)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1480, N'IBERIA', 145)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1481, N'TAHUAMANU', 145)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1482, N'MOQUEGUA', 146)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1483, N'CARUMAS', 146)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1484, N'CUCHUMBAYA', 146)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1485, N'SAMEGUA', 146)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1486, N'SAN CRISTOBAL', 146)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1487, N'TORATA', 146)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1488, N'OMATE', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1489, N'CHOJATA', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1490, N'COALAQUE', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1491, N'ICHU&Ntilde;A', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1492, N'LA CAPILLA', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1493, N'LLOQUE', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1494, N'MATALAQUE', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1495, N'PUQUINA', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1496, N'QUINISTAQUILLAS', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1497, N'UBINAS', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1498, N'YUNGA', 147)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1499, N'ILO', 148)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1500, N'EL ALGARROBAL', 148)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1501, N'PACOCHA', 148)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1502, N'CHAUPIMARCA', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1503, N'HUACHON', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1504, N'HUARIACA', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1505, N'HUAYLLAY', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1506, N'NINACACA', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1507, N'PALLANCHACRA', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1508, N'PAUCARTAMBO', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1509, N'SAN FCO.DE ASIS DE YARUSYACAN', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1510, N'SIMON BOLIVAR', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1511, N'TICLACAYAN', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1512, N'TINYAHUARCO', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1513, N'VICCO', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1514, N'YANACANCHA', 149)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1515, N'YANAHUANCA', 150)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1516, N'CHACAYAN', 150)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1517, N'GOYLLARISQUIZGA', 150)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1518, N'PAUCAR', 150)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1519, N'SAN PEDRO DE PILLAO', 150)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1520, N'SANTA ANA DE TUSI', 150)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1521, N'TAPUC', 150)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1522, N'VILCABAMBA', 150)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1523, N'OXAPAMPA', 151)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1524, N'CHONTABAMBA', 151)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1525, N'HUANCABAMBA', 151)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1526, N'PALCAZU', 151)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1527, N'POZUZO', 151)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1528, N'PUERTO BERMUDEZ', 151)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1529, N'VILLA RICA', 151)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1530, N'PIURA', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1531, N'CASTILLA', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1532, N'CATACAOS', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1533, N'CURA MORI', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1534, N'EL TALLAN', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1535, N'LA ARENA', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1536, N'LA UNION', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1537, N'LAS LOMAS', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1538, N'TAMBO GRANDE', 152)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1539, N'AYABACA', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1540, N'FRIAS', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1541, N'JILILI', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1542, N'LAGUNAS', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1543, N'MONTERO', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1544, N'PACAIPAMPA', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1545, N'PAIMAS', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1546, N'SAPILLICA', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1547, N'SICCHEZ', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1548, N'SUYO', 153)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1549, N'HUANCABAMBA', 154)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1550, N'CANCHAQUE', 154)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1551, N'EL CARMEN DE LA FRONTERA', 154)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1552, N'HUARMACA', 154)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1553, N'LALAQUIZ', 154)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1554, N'SAN MIGUEL DE EL FAIQUE', 154)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1555, N'SONDOR', 154)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1556, N'SONDORILLO', 154)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1557, N'CHULUCANAS', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1558, N'BUENOS AIRES', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1559, N'CHALACO', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1560, N'LA MATANZA', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1561, N'MORROPON', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1562, N'SALITRAL', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1563, N'SAN JUAN DE BIGOTE', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1564, N'SANTA CATALINA DE MOSSA', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1565, N'SANTO DOMINGO', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1566, N'YAMANGO', 155)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1567, N'PAITA', 156)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1568, N'AMOTAPE', 156)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1569, N'ARENAL', 156)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1570, N'COLAN', 156)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1571, N'LA HUACA', 156)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1572, N'TAMARINDO', 156)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1573, N'VICHAYAL', 156)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1574, N'SULLANA', 157)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1575, N'BELLAVISTA', 157)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1576, N'IGNACIO ESCUDERO', 157)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1577, N'LANCONES', 157)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1578, N'MARCAVELICA', 157)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1579, N'MIGUEL CHECA', 157)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1580, N'QUERECOTILLO', 157)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1581, N'SALITRAL', 157)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1582, N'PARI&Ntilde;AS', 158)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1583, N'EL ALTO', 158)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1584, N'LA BREA', 158)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1585, N'LOBITOS', 158)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1586, N'LOS ORGANOS', 158)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1587, N'MANCORA', 158)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1588, N'SECHURA', 159)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1589, N'BELLAVISTA DE LA UNION', 159)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1590, N'BERNAL', 159)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1591, N'CRISTO NOS VALGA', 159)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1592, N'VICE', 159)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1593, N'RINCONADA LLICUAR', 159)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1594, N'PUNO', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1595, N'ACORA', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1596, N'AMANTANI', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1597, N'ATUNCOLLA', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1598, N'CAPACHICA', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1599, N'CHUCUITO', 160)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1600, N'COATA', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1601, N'HUATA', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1602, N'MA&Ntilde;AZO', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1603, N'PAUCARCOLLA', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1604, N'PICHACANI', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1605, N'PLATERIA', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1606, N'SAN ANTONIO', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1607, N'TIQUILLACA', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1608, N'VILQUE', 160)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1609, N'AZANGARO', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1610, N'ACHAYA', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1611, N'ARAPA', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1612, N'ASILLO', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1613, N'CAMINACA', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1614, N'CHUPA', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1615, N'JOSE DOMINGO CHOQUEHUANCA', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1616, N'MU&Ntilde;ANI', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1617, N'POTONI', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1618, N'SAMAN', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1619, N'SAN ANTON', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1620, N'SAN JOSE', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1621, N'SAN JUAN DE SALINAS', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1622, N'SANTIAGO DE PUPUJA', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1623, N'TIRAPATA', 161)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1624, N'MACUSANI', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1625, N'AJOYANI', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1626, N'AYAPATA', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1627, N'COASA', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1628, N'CORANI', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1629, N'CRUCERO', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1630, N'ITUATA', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1631, N'OLLACHEA', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1632, N'SAN GABAN', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1633, N'USICAYOS', 162)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1634, N'JULI', 163)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1635, N'DESAGUADERO', 163)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1636, N'HUACULLANI', 163)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1637, N'KELLUYO', 163)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1638, N'PISACOMA', 163)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1639, N'POMATA', 163)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1640, N'ZEPITA', 163)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1641, N'ILAVE', 164)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1642, N'CAPAZO', 164)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1643, N'PILCUYO', 164)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1644, N'SANTA ROSA', 164)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1645, N'CONDURIRI', 164)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1646, N'HUANCANE', 165)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1647, N'COJATA', 165)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1648, N'HUATASANI', 165)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1649, N'INCHUPALLA', 165)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1650, N'PUSI', 165)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1651, N'ROSASPATA', 165)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1652, N'TARACO', 165)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1653, N'VILQUE CHICO', 165)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1654, N'LAMPA', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1655, N'CABANILLA', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1656, N'CALAPUJA', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1657, N'NICASIO', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1658, N'OCUVIRI', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1659, N'PALCA', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1660, N'PARATIA', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1661, N'PUCARA', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1662, N'SANTA LUCIA', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1663, N'VILAVILA', 166)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1664, N'AYAVIRI', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1665, N'ANTAUTA', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1666, N'CUPI', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1667, N'LLALLI', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1668, N'MACARI', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1669, N'NU&Ntilde;OA', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1670, N'ORURILLO', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1671, N'SANTA ROSA', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1672, N'UMACHIRI', 167)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1673, N'MOHO', 168)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1674, N'CONIMA', 168)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1675, N'HUAYRAPATA', 168)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1676, N'TILALI', 168)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1677, N'PUTINA', 169)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1678, N'ANANEA', 169)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1679, N'PEDRO VILCA APAZA', 169)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1680, N'QUILCAPUNCU', 169)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1681, N'SINA', 169)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1682, N'JULIACA', 170)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1683, N'CABANA', 170)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1684, N'CABANILLAS', 170)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1685, N'CARACOTO', 170)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1686, N'SANDIA', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1687, N'CUYOCUYO', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1688, N'LIMBANI', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1689, N'PATAMBUCO', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1690, N'PHARA', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1691, N'QUIACA', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1692, N'SAN JUAN DEL ORO', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1693, N'YANAHUAYA', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1694, N'ALTO INAMBARI', 171)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1695, N'YUNGUYO', 172)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1696, N'ANAPIA', 172)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1697, N'COPANI', 172)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1698, N'CUTURAPI', 172)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1699, N'OLLARAYA', 172)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1700, N'TINICACHI', 172)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1701, N'UNICACHI', 172)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1702, N'MOYOBAMBA', 173)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1703, N'CALZADA', 173)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1704, N'HABANA', 173)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1705, N'JEPELACIO', 173)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1706, N'SORITOR', 173)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1707, N'YANTALO', 173)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1708, N'BELLAVISTA', 174)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1709, N'ALTO BIAVO', 174)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1710, N'BAJO BIAVO', 174)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1711, N'HUALLAGA', 174)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1712, N'SAN PABLO', 174)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1713, N'SAN RAFAEL', 174)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1714, N'SAN JOSE DE SISA', 175)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1715, N'AGUA BLANCA', 175)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1716, N'SAN MARTIN', 175)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1717, N'SANTA ROSA', 175)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1718, N'SHATOJA', 175)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1719, N'SAPOSOA', 176)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1720, N'ALTO SAPOSOA', 176)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1721, N'EL ESLABON', 176)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1722, N'PISCOYACU', 176)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1723, N'SACANCHE', 176)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1724, N'TINGO DE SAPOSOA', 176)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1725, N'LAMAS', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1726, N'ALONSO DE ALVARADO', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1727, N'BARRANQUITA', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1728, N'CAYNARACHI', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1729, N'CU&Ntilde;UMBUQUI', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1730, N'PINTO RECODO', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1731, N'RUMISAPA', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1732, N'SAN ROQUE DE CUMBAZA', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1733, N'SHANAO', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1734, N'TABALOSOS', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1735, N'ZAPATERO', 177)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1736, N'JUANJUI', 178)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1737, N'CAMPANILLA', 178)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1738, N'HUICUNGO', 178)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1739, N'PACHIZA', 178)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1740, N'PAJARILLO', 178)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1741, N'PICOTA', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1742, N'BUENOS AIRES', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1743, N'CASPISAPA', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1744, N'PILLUANA', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1745, N'PUCACACA', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1746, N'SAN CRISTOBAL', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1747, N'SAN HILARION', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1748, N'SHAMBOYACU', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1749, N'TINGO DE PONASA', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1750, N'TRES UNIDOS', 179)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1751, N'RIOJA', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1752, N'AWAJUN', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1753, N'ELIAS SOPLIN VARGAS', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1754, N'NUEVA CAJAMARCA', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1755, N'PARDO MIGUEL', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1756, N'POSIC', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1757, N'SAN FERNANDO', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1758, N'YORONGOS', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1759, N'YURACYACU', 180)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1760, N'TARAPOTO', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1761, N'ALBERTO LEVEAU', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1762, N'CACATACHI', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1763, N'CHAZUTA', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1764, N'CHIPURANA', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1765, N'EL PORVENIR', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1766, N'HUIMBAYOC', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1767, N'JUAN GUERRA', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1768, N'LA BANDA DE SHILCAYO', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1769, N'MORALES', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1770, N'PAPAPLAYA', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1771, N'SAN ANTONIO', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1772, N'SAUCE', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1773, N'SHAPAJA', 181)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1774, N'TOCACHE', 182)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1775, N'NUEVO PROGRESO', 182)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1776, N'POLVORA', 182)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1777, N'SHUNTE', 182)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1778, N'UCHIZA', 182)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1779, N'TACNA', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1780, N'ALTO DE LA ALIANZA', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1781, N'CALANA', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1782, N'CIUDAD NUEVA', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1783, N'INCLAN', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1784, N'PACHIA', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1785, N'PALCA', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1786, N'POCOLLAY', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1787, N'SAMA', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1788, N'CORONEL GREGORIO ALBARRACIN LANCHIPA', 183)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1789, N'CANDARAVE', 184)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1790, N'CAIRANI', 184)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1791, N'CAMILACA', 184)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1792, N'CURIBAYA', 184)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1793, N'HUANUARA', 184)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1794, N'QUILAHUANI', 184)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1795, N'LOCUMBA', 185)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1796, N'ILABAYA', 185)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1797, N'ITE', 185)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1798, N'TARATA', 186)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1799, N'CHUCATAMANI', 186)
GO
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1800, N'ESTIQUE', 186)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1801, N'ESTIQUE-PAMPA', 186)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1802, N'SITAJARA', 186)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1803, N'SUSAPAYA', 186)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1804, N'TARUCACHI', 186)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1805, N'TICACO', 186)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1806, N'TUMBES', 187)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1807, N'CORRALES', 187)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1808, N'LA CRUZ', 187)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1809, N'PAMPAS DE HOSPITAL', 187)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1810, N'SAN JACINTO', 187)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1811, N'SAN JUAN DE LA VIRGEN', 187)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1812, N'ZORRITOS', 188)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1813, N'CASITAS', 188)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1814, N'ZARUMILLA', 189)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1815, N'AGUAS VERDES', 189)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1816, N'MATAPALO', 189)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1817, N'PAPAYAL', 189)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1818, N'CALLERIA', 190)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1819, N'CAMPOVERDE', 190)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1820, N'IPARIA', 190)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1821, N'MASISEA', 190)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1822, N'YARINACOCHA', 190)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1823, N'NUEVA REQUENA', 190)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1824, N'RAYMONDI', 191)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1825, N'SEPAHUA', 191)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1826, N'TAHUANIA', 191)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1827, N'YURUA', 191)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1828, N'PADRE ABAD', 192)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1829, N'IRAZOLA', 192)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1830, N'CURIMANA', 192)
INSERT [dbo].[distritos] ([codDistrito], [distrito], [codProvincia]) VALUES (1831, N'PURUS', 193)
SET IDENTITY_INSERT [dbo].[distritos] OFF
GO
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([dniCiudadano], [codEmpleado], [idCargo], [observaciones], [sueldo], [estadoEmpleado]) VALUES (N'46000000', 1, 1, NULL, 1500.5, N'1')
INSERT [dbo].[empleados] ([dniCiudadano], [codEmpleado], [idCargo], [observaciones], [sueldo], [estadoEmpleado]) VALUES (N'46000001', 2, 2, NULL, 1500.5, N'1')
INSERT [dbo].[empleados] ([dniCiudadano], [codEmpleado], [idCargo], [observaciones], [sueldo], [estadoEmpleado]) VALUES (N'46000002', 3, 3, NULL, 1600.5, N'1')
INSERT [dbo].[empleados] ([dniCiudadano], [codEmpleado], [idCargo], [observaciones], [sueldo], [estadoEmpleado]) VALUES (N'46000003', 4, 4, NULL, 1400, N'1')
INSERT [dbo].[empleados] ([dniCiudadano], [codEmpleado], [idCargo], [observaciones], [sueldo], [estadoEmpleado]) VALUES (N'46000004', 5, 5, NULL, 1800, N'1')
INSERT [dbo].[empleados] ([dniCiudadano], [codEmpleado], [idCargo], [observaciones], [sueldo], [estadoEmpleado]) VALUES (N'46000007', 6, 6, NULL, 1300, N'1')
INSERT [dbo].[empleados] ([dniCiudadano], [codEmpleado], [idCargo], [observaciones], [sueldo], [estadoEmpleado]) VALUES (N'46000008', 7, 4, NULL, 1200, N'1')
INSERT [dbo].[empleados] ([dniCiudadano], [codEmpleado], [idCargo], [observaciones], [sueldo], [estadoEmpleado]) VALUES (N'46000009', 8, 5, NULL, 1500, N'1')
SET IDENTITY_INSERT [dbo].[empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[migrations] ON 

INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (41, N'2014_10_12_000000_create_users_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (43, N'2019_08_19_000000_create_failed_jobs_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (44, N'2019_12_14_000001_create_personal_access_tokens_table', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (45, N'2021_11_28_222634_create_permission_tables', 1)
INSERT [dbo].[migrations] ([id], [migration], [batch]) VALUES (46, N'2014_10_12_100000_create_password_resets_table', 2)
SET IDENTITY_INSERT [dbo].[migrations] OFF
GO
INSERT [dbo].[model_has_roles] ([role_id], [model_type], [model_id]) VALUES (1, N'App\Models\User', 1)
GO
SET IDENTITY_INSERT [dbo].[nivelStudios] ON 

INSERT [dbo].[nivelStudios] ([idNivel], [nivel]) VALUES (1, N'Educación inicial')
INSERT [dbo].[nivelStudios] ([idNivel], [nivel]) VALUES (2, N'Educación primaria')
INSERT [dbo].[nivelStudios] ([idNivel], [nivel]) VALUES (3, N'Educación secundaria')
INSERT [dbo].[nivelStudios] ([idNivel], [nivel]) VALUES (4, N'Educación superior técnica culminada')
INSERT [dbo].[nivelStudios] ([idNivel], [nivel]) VALUES (5, N'Educación superior técnica no culminada')
INSERT [dbo].[nivelStudios] ([idNivel], [nivel]) VALUES (6, N'Educación superior universitaria culminada')
INSERT [dbo].[nivelStudios] ([idNivel], [nivel]) VALUES (7, N'Educación superior universitaria no culminada')
SET IDENTITY_INSERT [dbo].[nivelStudios] OFF
GO
INSERT [dbo].[organizacion] ([ruc], [razonSocial], [logo], [rubro], [igv], [direccion], [correo], [numTelefonico], [estado]) VALUES (N'20606939940', N'COMERCIAL EL VALLE S.A.C.', N'null', N'Alimentos', 0, N'Jr. La Victoria NRO. 704', N'cvalleg@gmail.com', N'930154994 ', N'1')
GO
SET IDENTITY_INSERT [dbo].[permissions] ON 

INSERT [dbo].[permissions] ([id], [name], [guard_name], [created_at], [updated_at]) VALUES (1, N'Ver Usuarios', N'web', CAST(N'2021-11-12T19:15:07.4333000' AS DateTime2), CAST(N'2021-11-12T19:15:07.4333000' AS DateTime2))
INSERT [dbo].[permissions] ([id], [name], [guard_name], [created_at], [updated_at]) VALUES (2, N'Editar Usuarios', N'web', CAST(N'2021-11-12T19:15:19.2800000' AS DateTime2), CAST(N'2021-11-12T19:15:19.2800000' AS DateTime2))
INSERT [dbo].[permissions] ([id], [name], [guard_name], [created_at], [updated_at]) VALUES (3, N'Delete Users', N'web', CAST(N'2021-11-12T19:15:32.1667000' AS DateTime2), CAST(N'2021-11-12T19:15:32.1667000' AS DateTime2))
INSERT [dbo].[permissions] ([id], [name], [guard_name], [created_at], [updated_at]) VALUES (4, N'Crear user', N'web', CAST(N'2021-11-12T19:15:38.0100000' AS DateTime2), CAST(N'2021-11-12T19:15:38.0100000' AS DateTime2))
INSERT [dbo].[permissions] ([id], [name], [guard_name], [created_at], [updated_at]) VALUES (5, N'Ver Categorias', N'web', CAST(N'2021-12-23T00:09:23.9480000' AS DateTime2), CAST(N'2021-12-23T00:09:23.9480000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (1, 1, N'Gaseosa INCA KOLA', N'Cajas', 15, 18, 30, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (2, 1, N'Cerveza PILSEN', N'Botellas', 7, 9, 60, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (3, 9, N'Aceite de Oliva', N'Botellas', 8, 10, 13, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (4, 2, N'Pimienta BADIA', N'Frascos', 3, 4, 20, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (5, 2, N'DOÑA GUSTA', N'Cajas', 1, 1.5, 20, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (6, 2, N'Ajo Molido', N'Frascos', 1, 2, 120, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (7, 3, N'Fruta Deshidratada', N'Bolsas', 10, 12, 15, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (8, 2, N'Mayonesa KRAFT Light', N'Frascos', 5, 7, 6, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (9, 4, N'Filete de Pechuga', N'Bolsas', 6, 7, 15, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (10, 5, N'Trozos de Salmón', N'Bolsas', 22, 25, 31, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (11, 6, N'Queso Mantecoso', N'Paquetes', 18, 21, 22, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (12, 6, N'Queso Suizo Huacariz', N'Paquetes', 25, 28, 30, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (13, 5, N'Portola La Guitanita', N'Latas', 3, 6, 24, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (14, 3, N'Narajas Daniel', N'Cajas', 20.25, 23.25, 30, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (15, 2, N'Salsa de soja baja en sodio', N'Botellas', 12.5, 15.5, 35, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (16, 7, N'Postre de merengue Pavlova', N'Cajas', 15, 17, 5, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (17, 4, N'Pechuga de pollo enlatado', N'Latas', 3, 6, 20, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (18, 8, N'Costa cereal bar', N'Cajas', 59.5, 62.5, 30, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (19, 8, N'Costa cereal bar (manzana y canela)', N'Cajas', 6.5, 8.5, 25, N'1', NULL)
INSERT [dbo].[productos] ([idProducto], [idTipo], [descripcionProducto], [medida], [precioC], [precioV], [stock], [estado], [image]) VALUES (20, 8, N'Costa choco cereal', N'Cajas', 2, 3, 20, N'1', NULL)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[proveedores] ON 

INSERT [dbo].[proveedores] ([idProveedor], [estado], [dniRepresentante], [razonSocial], [direccion], [ciudad], [telefono], [codPostal], [email]) VALUES (2, N'1', N'74122466', N'AMU DISTRIBUCIONES S.A.C', N'Calle los Martires Mz.5 N°.321', N'LA LIBERTAD/CHEPEN/CHEPEN', N'963248568 ', N'7094  ', N'distribucion@gmail.com')
SET IDENTITY_INSERT [dbo].[proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[provincias] ON 

INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (1, N'CHACHAPOYAS ', 1)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (2, N'BAGUA', 1)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (3, N'BONGARA', 1)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (4, N'CONDORCANQUI', 1)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (5, N'LUYA', 1)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (6, N'RODRIGUEZ DE MENDOZA', 1)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (7, N'UTCUBAMBA', 1)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (8, N'HUARAZ', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (9, N'AIJA', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (10, N'ANTONIO RAYMONDI', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (11, N'ASUNCION', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (12, N'BOLOGNESI', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (13, N'CARHUAZ', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (14, N'CARLOS FERMIN FITZCARRALD', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (15, N'CASMA', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (16, N'CORONGO', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (17, N'HUARI', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (18, N'HUARMEY', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (19, N'HUAYLAS', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (20, N'MARISCAL LUZURIAGA', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (21, N'OCROS', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (22, N'PALLASCA', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (23, N'POMABAMBA', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (24, N'RECUAY', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (25, N'SANTA', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (26, N'SIHUAS', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (27, N'YUNGAY', 2)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (28, N'ABANCAY', 3)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (29, N'ANDAHUAYLAS', 3)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (30, N'ANTABAMBA', 3)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (31, N'AYMARAES', 3)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (32, N'COTABAMBAS', 3)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (33, N'CHINCHEROS', 3)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (34, N'GRAU', 3)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (35, N'AREQUIPA', 4)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (36, N'CAMANA', 4)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (37, N'CARAVELI', 4)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (38, N'CASTILLA', 4)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (39, N'CAYLLOMA', 4)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (40, N'CONDESUYOS', 4)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (41, N'ISLAY', 4)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (42, N'LA UNION', 4)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (43, N'HUAMANGA', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (44, N'CANGALLO', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (45, N'HUANCA SANCOS', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (46, N'HUANTA', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (47, N'LA MAR', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (48, N'LUCANAS', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (49, N'PARINACOCHAS', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (50, N'PAUCAR DEL SARA SARA', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (51, N'SUCRE', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (52, N'VICTOR FAJARDO', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (53, N'VILCAS HUAMAN', 5)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (54, N'CAJAMARCA', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (55, N'CAJABAMBA', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (56, N'CELENDIN', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (57, N'CHOTA ', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (58, N'CONTUMAZA', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (59, N'CUTERVO', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (60, N'HUALGAYOC', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (61, N'JAEN', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (62, N'SAN IGNACIO', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (63, N'SAN MARCOS', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (64, N'SAN PABLO', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (65, N'SANTA CRUZ', 6)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (66, N'CALLAO', 7)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (67, N'CUSCO', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (68, N'ACOMAYO', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (69, N'ANTA', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (70, N'CALCA', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (71, N'CANAS', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (72, N'CANCHIS', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (73, N'CHUMBIVILCAS', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (74, N'ESPINAR', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (75, N'LA CONVENCION', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (76, N'PARURO', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (77, N'PAUCARTAMBO', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (78, N'QUISPICANCHI', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (79, N'URUBAMBA', 8)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (80, N'HUANCAVELICA', 9)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (81, N'ACOBAMBA', 9)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (82, N'ANGARAES', 9)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (83, N'CASTROVIRREYNA', 9)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (84, N'CHURCAMPA', 9)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (85, N'HUAYTARA', 9)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (86, N'TAYACAJA', 9)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (87, N'HUANUCO', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (88, N'AMBO', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (89, N'DOS DE MAYO', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (90, N'HUACAYBAMBA', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (91, N'HUAMALIES', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (92, N'LEONCIO PRADO', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (93, N'MARA&Ntilde;ON', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (94, N'PACHITEA', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (95, N'PUERTO INCA', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (96, N'LAURICOCHA', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (97, N'YAROWILCA', 10)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (98, N'ICA', 11)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (99, N'CHINCHA', 11)
GO
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (100, N'NAZCA', 11)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (101, N'PALPA', 11)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (102, N'PISCO', 11)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (103, N'HUANCAYO', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (104, N'CONCEPCION', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (105, N'CHANCHAMAYO', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (106, N'JAUJA', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (107, N'JUNIN', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (108, N'SATIPO', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (109, N'TARMA', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (110, N'YAULI', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (111, N'CHUPACA', 12)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (112, N'TRUJILLO', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (113, N'ASCOPE', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (114, N'BOLIVAR', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (115, N'CHEPEN', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (116, N'JULCAN', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (117, N'OTUZCO', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (118, N'PACASMAYO', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (119, N'PATAZ', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (120, N'SANCHEZ CARRION', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (121, N'SANTIAGO DE CHUCO', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (122, N'GRAN CHIMU', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (123, N'VIRU', 13)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (124, N'CHICLAYO', 14)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (125, N'FERRE&Ntilde;AFE', 14)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (126, N'LAMBAYEQUE', 14)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (127, N'LIMA', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (128, N'BARRANCA', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (129, N'CAJATAMBO', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (130, N'CANTA', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (131, N'CA&Ntilde;ETE', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (132, N'HUARAL', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (133, N'HUAROCHIRI', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (134, N'HUAURA', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (135, N'OYON', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (136, N'YAUYOS', 15)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (137, N'MAYNAS', 16)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (138, N'ALTO AMAZONAS', 16)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (139, N'LORETO', 16)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (140, N'MARISCAL RAMON CASTILLA', 16)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (141, N'REQUENA', 16)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (142, N'UCAYALI', 16)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (143, N'TAMBOPATA', 17)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (144, N'MANU', 17)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (145, N'TAHUAMANU', 17)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (146, N'MARISCAL NIETO', 18)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (147, N'GENERAL SANCHEZ CERRO', 18)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (148, N'ILO', 18)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (149, N'PASCO', 19)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (150, N'DANIEL ALCIDES CARRION', 19)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (151, N'OXAPAMPA', 19)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (152, N'PIURA', 20)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (153, N'AYABACA', 20)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (154, N'HUANCABAMBA', 20)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (155, N'MORROPON', 20)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (156, N'PAITA', 20)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (157, N'SULLANA', 20)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (158, N'TALARA', 20)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (159, N'SECHURA', 20)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (160, N'PUNO', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (161, N'AZANGARO', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (162, N'CARABAYA', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (163, N'CHUCUITO', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (164, N'EL COLLAO', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (165, N'HUANCANE', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (166, N'LAMPA', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (167, N'MELGAR', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (168, N'MOHO', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (169, N'SAN ANTONIO DE PUTINA', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (170, N'SAN ROMAN', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (171, N'SANDIA', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (172, N'YUNGUYO', 21)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (173, N'MOYOBAMBA', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (174, N'BELLAVISTA', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (175, N'EL DORADO', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (176, N'HUALLAGA', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (177, N'LAMAS', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (178, N'MARISCAL CACERES', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (179, N'PICOTA', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (180, N'RIOJA', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (181, N'SAN MARTIN', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (182, N'TOCACHE', 22)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (183, N'TACNA', 23)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (184, N'CANDARAVE', 23)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (185, N'JORGE BASADRE', 23)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (186, N'TARATA', 23)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (187, N'TUMBES', 24)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (188, N'CONTRALMIRANTE VILLAR', 24)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (189, N'ZARUMILLA', 24)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (190, N'CORONEL PORTILLO', 25)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (191, N'ATALAYA', 25)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (192, N'PADRE ABAD', 25)
INSERT [dbo].[provincias] ([codProvincia], [provincia], [codDepartamento]) VALUES (193, N'PURUS', 25)
SET IDENTITY_INSERT [dbo].[provincias] OFF
GO
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (1, 1)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (1, 3)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (2, 1)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (2, 3)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (3, 1)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (3, 3)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (4, 1)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (4, 3)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (5, 1)
INSERT [dbo].[role_has_permissions] ([permission_id], [role_id]) VALUES (5, 3)
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name], [guard_name], [created_at], [updated_at]) VALUES (1, N'Administrador', N'web', CAST(N'2021-09-12T16:18:31.2967000' AS DateTime2), CAST(N'2021-09-12T16:18:31.2967000' AS DateTime2))
INSERT [dbo].[roles] ([id], [name], [guard_name], [created_at], [updated_at]) VALUES (3, N'Jefe de Compras', N'web', CAST(N'2021-12-23T00:09:49.4270000' AS DateTime2), CAST(N'2021-12-23T00:09:49.4270000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tipoProducto] ON 

INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (1, N'Bebidas')
INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (2, N'Condimentos')
INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (3, N'Frutas/Verduras')
INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (4, N'Carnes')
INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (5, N'Pescado/Marisco')
INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (6, N'Lácteos')
INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (7, N'Repostería')
INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (8, N'Granos/Cereales')
INSERT [dbo].[tipoProducto] ([idTipo], [descripcion]) VALUES (9, N'Abarrotes')
SET IDENTITY_INSERT [dbo].[tipoProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [email_verified_at], [password], [last_login], [status], [code_empleado], [avatar], [google_id], [google_token], [remember_token], [created_at], [updated_at]) VALUES (1, N'Wayner Espinoza', N'espinozaperez2504@gmail.com', NULL, N'$2y$10$PZRpo00wancS6XWc4Qhd4.vx8RGafucy2iQOyRpx5XHCmtgrTcv2q', CAST(N'2021-12-23T00:28:25.0920000' AS DateTime2), N'1', 2, N'https://lh3.googleusercontent.com/a/AATXAJy8dkFGYQR1rozrGRp3gyaLDRa34ks734eYNqmP=s96-c', N'115023311435563300627', N'ya29.a0ARrdaM_Wk1Fdu13TD_M8kGZux6iWliH1m4efWF13mCbWkya5VyAIRNs7ESiltiOcTlrakqK0jC65IVpS0HSUmdEG4Er3l08uEm1ii0yX5jVwUPUfreMqMYJYGt4h15Dbp-bUu9uEJF-zKekbihbiK4F1j6nQ', N'V77TVxuxH7rKMEmL8qvMk401r4n78wHHR5pHv2q7S6UNNZBW52tIIXGVcA86', CAST(N'2021-09-12T16:18:31.3667000' AS DateTime2), CAST(N'2021-12-23T00:28:25.0920000' AS DateTime2))
INSERT [dbo].[users] ([id], [name], [email], [email_verified_at], [password], [last_login], [status], [code_empleado], [avatar], [google_id], [google_token], [remember_token], [created_at], [updated_at]) VALUES (4, N'Luis Izquierdo', N'lizquierdo@unitru.edu.pe', NULL, N'$2y$10$9r11c.5HSjWguJf1EtPto.KO7BtUfOZdhd4xX.8uv8wLQGMcY1/8G', NULL, N'1', 3, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-12-22T13:29:21.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [failed_jobs_uuid_unique]    Script Date: 23/12/2021 10:16:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [failed_jobs_uuid_unique] ON [dbo].[failed_jobs]
(
	[uuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [model_has_permissions_model_id_model_type_index]    Script Date: 23/12/2021 10:16:39 ******/
CREATE NONCLUSTERED INDEX [model_has_permissions_model_id_model_type_index] ON [dbo].[model_has_permissions]
(
	[model_id] ASC,
	[model_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [model_has_roles_model_id_model_type_index]    Script Date: 23/12/2021 10:16:39 ******/
CREATE NONCLUSTERED INDEX [model_has_roles_model_id_model_type_index] ON [dbo].[model_has_roles]
(
	[model_id] ASC,
	[model_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [password_resets_email_index]    Script Date: 23/12/2021 10:16:39 ******/
CREATE NONCLUSTERED INDEX [password_resets_email_index] ON [dbo].[password_resets]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [permissions_name_guard_name_unique]    Script Date: 23/12/2021 10:16:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [permissions_name_guard_name_unique] ON [dbo].[permissions]
(
	[name] ASC,
	[guard_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_token_unique]    Script Date: 23/12/2021 10:16:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [personal_access_tokens_token_unique] ON [dbo].[personal_access_tokens]
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [personal_access_tokens_tokenable_type_tokenable_id_index]    Script Date: 23/12/2021 10:16:39 ******/
CREATE NONCLUSTERED INDEX [personal_access_tokens_tokenable_type_tokenable_id_index] ON [dbo].[personal_access_tokens]
(
	[tokenable_type] ASC,
	[tokenable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [roles_name_guard_name_unique]    Script Date: 23/12/2021 10:16:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [roles_name_guard_name_unique] ON [dbo].[roles]
(
	[name] ASC,
	[guard_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [users_email_unique]    Script Date: 23/12/2021 10:16:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [users_email_unique] ON [dbo].[users]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ciudadanos] ADD  CONSTRAINT [DF_State]  DEFAULT ('1') FOR [estado]
GO
ALTER TABLE [dbo].[ciudadanos] ADD  DEFAULT ((1)) FOR [idNivel]
GO
ALTER TABLE [dbo].[failed_jobs] ADD  DEFAULT (getdate()) FOR [failed_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('1') FOR [status]
GO
ALTER TABLE [dbo].[aprobaciones]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([codEmpleado])
REFERENCES [dbo].[empleados] ([codEmpleado])
GO
ALTER TABLE [dbo].[aprobaciones] CHECK CONSTRAINT [R_18]
GO
ALTER TABLE [dbo].[aprobaciones]  WITH CHECK ADD  CONSTRAINT [r_a_s] FOREIGN KEY([idSolicitud])
REFERENCES [dbo].[solicitudes] ([idSolicitud])
GO
ALTER TABLE [dbo].[aprobaciones] CHECK CONSTRAINT [r_a_s]
GO
ALTER TABLE [dbo].[areas]  WITH CHECK ADD  CONSTRAINT [R_5] FOREIGN KEY([idDepart])
REFERENCES [dbo].[departEmpresa] ([idDepart])
GO
ALTER TABLE [dbo].[areas] CHECK CONSTRAINT [R_5]
GO
ALTER TABLE [dbo].[cargos]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([idArea])
REFERENCES [dbo].[areas] ([idArea])
GO
ALTER TABLE [dbo].[cargos] CHECK CONSTRAINT [R_17]
GO
ALTER TABLE [dbo].[ciudadanos]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([codDistrito])
REFERENCES [dbo].[distritos] ([codDistrito])
GO
ALTER TABLE [dbo].[ciudadanos] CHECK CONSTRAINT [R_3]
GO
ALTER TABLE [dbo].[ciudadanos]  WITH CHECK ADD  CONSTRAINT [R_44] FOREIGN KEY([idNivel])
REFERENCES [dbo].[nivelStudios] ([idNivel])
GO
ALTER TABLE [dbo].[ciudadanos] CHECK CONSTRAINT [R_44]
GO
ALTER TABLE [dbo].[detallePedidos]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([idPedido])
REFERENCES [dbo].[pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[detallePedidos] CHECK CONSTRAINT [R_8]
GO
ALTER TABLE [dbo].[detallePedidos]  WITH CHECK ADD  CONSTRAINT [R_9] FOREIGN KEY([idProducto])
REFERENCES [dbo].[productos] ([idProducto])
GO
ALTER TABLE [dbo].[detallePedidos] CHECK CONSTRAINT [R_9]
GO
ALTER TABLE [dbo].[detalleProformaProveedor]  WITH CHECK ADD  CONSTRAINT [R_33] FOREIGN KEY([idProforma])
REFERENCES [dbo].[proformaProveedor] ([idProforma])
GO
ALTER TABLE [dbo].[detalleProformaProveedor] CHECK CONSTRAINT [R_33]
GO
ALTER TABLE [dbo].[detalleProformaProveedor]  WITH CHECK ADD  CONSTRAINT [R_35] FOREIGN KEY([idDetalle])
REFERENCES [dbo].[detallePedidos] ([idDetalle])
GO
ALTER TABLE [dbo].[detalleProformaProveedor] CHECK CONSTRAINT [R_35]
GO
ALTER TABLE [dbo].[distritos]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([codProvincia])
REFERENCES [dbo].[provincias] ([codProvincia])
GO
ALTER TABLE [dbo].[distritos] CHECK CONSTRAINT [R_2]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([dniCiudadano])
REFERENCES [dbo].[ciudadanos] ([dniCiudadano])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [R_4]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [R_6] FOREIGN KEY([idCargo])
REFERENCES [dbo].[cargos] ([idCargo])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [R_6]
GO
ALTER TABLE [dbo].[model_has_permissions]  WITH CHECK ADD  CONSTRAINT [model_has_permissions_permission_id_foreign] FOREIGN KEY([permission_id])
REFERENCES [dbo].[permissions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[model_has_permissions] CHECK CONSTRAINT [model_has_permissions_permission_id_foreign]
GO
ALTER TABLE [dbo].[model_has_roles]  WITH CHECK ADD  CONSTRAINT [model_has_roles_role_id_foreign] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[model_has_roles] CHECK CONSTRAINT [model_has_roles_role_id_foreign]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([idTipo])
REFERENCES [dbo].[tipoProducto] ([idTipo])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[proformaProveedor]  WITH CHECK ADD  CONSTRAINT [R_30] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[proformaProveedor] CHECK CONSTRAINT [R_30]
GO
ALTER TABLE [dbo].[proformaProveedor]  WITH CHECK ADD  CONSTRAINT [R_31] FOREIGN KEY([idPedido])
REFERENCES [dbo].[pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[proformaProveedor] CHECK CONSTRAINT [R_31]
GO
ALTER TABLE [dbo].[proveedores]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([dniRepresentante])
REFERENCES [dbo].[ciudadanos] ([dniCiudadano])
GO
ALTER TABLE [dbo].[proveedores] CHECK CONSTRAINT [R_21]
GO
ALTER TABLE [dbo].[provincias]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([codDepartamento])
REFERENCES [dbo].[departamentos] ([codDepartamento])
GO
ALTER TABLE [dbo].[provincias] CHECK CONSTRAINT [R_1]
GO
ALTER TABLE [dbo].[role_has_permissions]  WITH CHECK ADD  CONSTRAINT [role_has_permissions_permission_id_foreign] FOREIGN KEY([permission_id])
REFERENCES [dbo].[permissions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[role_has_permissions] CHECK CONSTRAINT [role_has_permissions_permission_id_foreign]
GO
ALTER TABLE [dbo].[role_has_permissions]  WITH CHECK ADD  CONSTRAINT [role_has_permissions_role_id_foreign] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[role_has_permissions] CHECK CONSTRAINT [role_has_permissions_role_id_foreign]
GO
ALTER TABLE [dbo].[solicitudes]  WITH CHECK ADD  CONSTRAINT [R_27] FOREIGN KEY([idPedido])
REFERENCES [dbo].[pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[solicitudes] CHECK CONSTRAINT [R_27]
GO
ALTER TABLE [dbo].[solicitudesProforma]  WITH CHECK ADD  CONSTRAINT [R_36] FOREIGN KEY([idProforma])
REFERENCES [dbo].[proformaProveedor] ([idProforma])
GO
ALTER TABLE [dbo].[solicitudesProforma] CHECK CONSTRAINT [R_36]
GO
ALTER TABLE [dbo].[solicitudesProforma]  WITH CHECK ADD  CONSTRAINT [R_37] FOREIGN KEY([idSolicitud])
REFERENCES [dbo].[solicitudes] ([idSolicitud])
GO
ALTER TABLE [dbo].[solicitudesProforma] CHECK CONSTRAINT [R_37]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [users_code_empleado_foreign] FOREIGN KEY([code_empleado])
REFERENCES [dbo].[empleados] ([codEmpleado])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [users_code_empleado_foreign]
GO
/****** Object:  StoredProcedure [dbo].[citizens]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[citizens]
as
select 
	dniCiudadano as dni,
	CONCAT(nombres,' ', apellidos) as fullName,
	(CASE sexo
		When 'M' Then 'Masculino'
		When 'F' Then 'Femenino' 
	end) as sexo,
	floor((cast(convert(varchar(8),getdate(),112) as int) -
	cast(convert(varchar(8),ciudadanos.fechaNacimiento,112) as int) ) / 10000
	) as age,
	correo as email,
	direccion as address,
	telefono1 as phoneOne
	from ciudadanos 
	where estado=1;
GO
/****** Object:  StoredProcedure [dbo].[employees]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[employees]
as
select 
	ciu.dniCiudadano as dni, 
	CONCAT(ciu.nombres,' ', ciu.apellidos) as fullName,
	car.cargo
from empleados as emp
join ciudadanos as ciu on ciu.dniCiudadano = emp.dniCiudadano
join cargos as car on car.idCargo = emp.idCargo;
GO
/****** Object:  StoredProcedure [dbo].[listProviders]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[listProviders]
as
begin
select 
	pro.idProveedor									as keyPro,
	pro.dniRepresentante							as dni,
	CONCAT(ciu.nombres, ' ', ciu.apellidos)			as names,
	pro.razonSocial									as businessName,
	pro.estado										as status
	from proveedores as pro 
	inner join ciudadanos as ciu 
		on pro.dniRepresentante = ciu.dniCiudadano where pro.estado = 1
end

GO
/****** Object:  StoredProcedure [dbo].[listProvidersNew]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Update ciudadanos set estado=1 where dniCiudadano=74122466
create   procedure [dbo].[listProvidersNew]
as
SELECT UPPER(CONCAT(nombres, ' ', apellidos)) as names, dniCiudadano as dni
FROM ciudadanos 
Except  
SELECT UPPER(CONCAT(ciu.nombres, ' ', ciu.apellidos)) as names, emp.dniCiudadano as dni
FROM empleados as emp inner join ciudadanos as ciu on ciu.dniCiudadano = emp.dniCiudadano

GO
/****** Object:  StoredProcedure [dbo].[sp_EmpleadoArea]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_EmpleadoArea](@code int) as
begin
select  u.name,c.cargo,a.area_descripcion as area 
	from users u
inner join empleados e on u.code_empleado=e.codEmpleado
inner join cargos c on e.idCargo=c.idCargo
inner join areas a on c.idArea=a.idArea
where u.id=@code
end
GO
/****** Object:  StoredProcedure [dbo].[sp_updatePerson]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_updatePerson]
	@dni char(8)
as
select c.*,p.codProvincia,dp.codDepartamento
from ciudadanos c
inner join distritos d on c.codDistrito = d.codDistrito
inner join provincias p on d.codProvincia = p.codProvincia
inner join departamentos dp on p.codDepartamento=dp.codDepartamento
where c.dniCiudadano=@dni
GO
/****** Object:  StoredProcedure [dbo].[spEmployeesNotUsers]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spEmployeesNotUsers]
as
begin
SELECT UPPER(CONCAT(ciu.nombres, ' ', ciu.apellidos)) as names, ciu.dniCiudadano as dni,
ciu.correo as email, emp.codEmpleado FROM ciudadanos as ciu inner join empleados as emp on emp.dniCiudadano = ciu.dniCiudadano
Except 
SELECT UPPER(CONCAT(ciu.nombres, ' ', ciu.apellidos)) as names, ciu.dniCiudadano as dni,
ciu.correo as email, emp.codEmpleado 
FROM ciudadanos as ciu inner join users as uss on uss.email = ciu.correo inner join empleados as emp on emp.dniCiudadano = ciu.dniCiudadano
end
GO
/****** Object:  StoredProcedure [dbo].[spListCategories]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[spListCategories]
as
begin
	select id = 0 , description = 'Total de Productos', count(*) amountProduct from productos
	union
	select 
		pro.idTipo							as id,
		tip.descripcion						as description, 
		count(pro.idProducto)				as amountProduct
	from productos as pro 
	inner join tipoProducto as tip 
		on tip.idTipo = pro.idTipo 
	group by pro.idTipo, tip.descripcion;
end

exec spListCategories

GO
/****** Object:  StoredProcedure [dbo].[spListProducts]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[spListProducts](@id tinyint)
as
begin
	if (@id = 0)
		select * from productos;
	else
		select * from productos where idTipo = @id;
end

exec spListProducts 1;
GO
/****** Object:  StoredProcedure [dbo].[spListProductsToProforma]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spListProductsToProforma]
as
begin
select 
	pro.idProducto					as id,
	pro.image,
	pro.descripcionProducto			as product,
	tip.descripcion					as category,
	pro.stock,
	pro.precioC,
	pro.medida						as measure
from productos as pro 
inner join tipoProducto as tip 
	on tip.idTipo = pro.idTipo
end
GO
/****** Object:  StoredProcedure [dbo].[suppliers]    Script Date: 23/12/2021 10:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[suppliers]
as
select 
	ciu.dniCiudadano as dni, 
	CONCAT(ciu.nombres,' ', ciu.apellidos) as fullName,
	pro.razonSocial as businessName,
	pro.estado as state
from proveedores as pro
join ciudadanos as ciu on ciu.dniCiudadano = pro.dniRepresentante
GO
USE [master]
GO
ALTER DATABASE [DBApprovals] SET  READ_WRITE 
GO
