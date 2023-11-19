Use master
Go
IF DB_ID('Consulta_Operadores_Comercio_Exterior_DW') IS NOT NULL
BEGIN
    -- Eliminar la base de datos si existe
    EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = 'Consulta_Operadores_Comercio_Exterior_DW'
    ALTER DATABASE [Consulta_Operadores_Comercio_Exterior_DW] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE [Consulta_Operadores_Comercio_Exterior_DW]
END
Go

-- Crear la base de datos
CREATE DATABASE [Consulta_Operadores_Comercio_Exterior_DW]
GO
Use Consulta_Operadores_Comercio_Exterior_DW
go

/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      HP Inc.
 * Project :      DW Propuesta.DM1
 * Author :       oscarrodrigogamezbalmaceda@hotmail.com
 *
 * Date Created : Monday, June 19, 2023 11:17:05
 * Target DBMS : Microsoft SQL Server 2008
 */

/* 
 * TABLE: Dim_Aduana 
 */

CREATE TABLE Dim_Aduana(
    Aduana_Key    int             IDENTITY(1,1),
    Id_Aduana     int             NOT NULL,
    Aduana        varchar(100)    NOT NULL,
    CONSTRAINT PK__Aduana__F710AD5D6A1B107A_1 PRIMARY KEY NONCLUSTERED (Aduana_Key)
)
go



IF OBJECT_ID('Dim_Aduana') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Aduana >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Aduana >>>'
go

/* 
 * TABLE: Dim_Declaracion 
 */

CREATE TABLE Dim_Declaracion(
    Declaracion_Key               int             IDENTITY(1,1),
    Id_Declaracion                int             NOT NULL,
    Id_Usuario                    varchar(15)     NULL,
    Nombre_Usuario                varchar(50)     NULL,
    TipoRazon_Usuario             varchar(30)     NULL,
    Estado_Usuario                char(15)         NULL,
    ActividadEconomica_Usuario    varchar(30)     NULL,
    Domicilio_Usuario             varchar(100)    NULL,
    Telefono                      varchar(20)     NULL,
    Correo_Usuario                varchar(50)     NULL,
    Aduana_Key                    int             NULL,
    Regimen_Key                   int             NULL,
    EstadoDeclaracion_Key         int             NULL,
    CONSTRAINT PK__Declarac__13291DE9CFD1D619_1 PRIMARY KEY NONCLUSTERED (Declaracion_Key)
)
go



IF OBJECT_ID('Dim_Declaracion') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Declaracion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Declaracion >>>'
go

/* 
 * TABLE: Dim_Estado_Declaracion 
 */

CREATE TABLE Dim_Estado_Declaracion(
    EstadoDeclaracion_Key    int             IDENTITY(1,1),
    Id_EstadoDeclaracion     int             NOT NULL,
    Estado                   varchar(100)    NULL,
    CONSTRAINT PK__Estado_D__29C14B675A3D47D0_1 PRIMARY KEY NONCLUSTERED (EstadoDeclaracion_Key)
)
go



IF OBJECT_ID('Dim_Estado_Declaracion') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Estado_Declaracion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Estado_Declaracion >>>'
go

/* 
 * TABLE: Dim_EstadoAdeudo 
 */

CREATE TABLE Dim_EstadoAdeudo(
    EstadoAdeudo_Key    int            IDENTITY(1,1),
    Id_EstadoAdeudo     int            NOT NULL,
    EstadoAdeudo        varchar(50)    NULL,
    CONSTRAINT PK__EstadoAd__1EF0EA7337B37431 PRIMARY KEY NONCLUSTERED (EstadoAdeudo_Key)
)
go



IF OBJECT_ID('Dim_EstadoAdeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_EstadoAdeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_EstadoAdeudo >>>'
go

/* 
 * TABLE: Dim_EstadoAuditoria 
 */

CREATE TABLE Dim_EstadoAuditoria(
    EstadoAuditoria_Key    int             IDENTITY(1,1),
    Id_EstadoAuditoria     int             NOT NULL,
    EstadoAuditoria        varchar(100)    NULL,
    CONSTRAINT PK29 PRIMARY KEY NONCLUSTERED (EstadoAuditoria_Key)
)
go



IF OBJECT_ID('Dim_EstadoAuditoria') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_EstadoAuditoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_EstadoAuditoria >>>'
go

/* 
 * TABLE: Dim_FormaAuditoria 
 */

CREATE TABLE Dim_FormaAuditoria(
    FormaAuditoria_Key    int             IDENTITY(1,1),
    Id_FormaAuditoria     int             NOT NULL,
    FormaAuditoria        varchar(100)    NULL,
    CONSTRAINT PK__FormaAud__426C2734E6D76E0B_1 PRIMARY KEY NONCLUSTERED (FormaAuditoria_Key)
)
go



IF OBJECT_ID('Dim_FormaAuditoria') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_FormaAuditoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_FormaAuditoria >>>'
go

/* 
 * TABLE: Dim_MotivoAdeudo 
 */

CREATE TABLE Dim_MotivoAdeudo(
    MotivoAdeudo_Key    int             IDENTITY(1,1),
    Id_MotivoAdeudo     int             NOT NULL,
    MotivoAdeudo        varchar(100)    NULL,
    CONSTRAINT PK35 PRIMARY KEY NONCLUSTERED (MotivoAdeudo_Key)
)
go



IF OBJECT_ID('Dim_MotivoAdeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_MotivoAdeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_MotivoAdeudo >>>'
go

/* 
 * TABLE: Dim_Regimen 
 */

CREATE TABLE Dim_Regimen(
    Regimen_Key    int             IDENTITY(1,1),
    Id_Regimen     int             NOT NULL,
    Regimen        varchar(100)    NULL,
    CONSTRAINT PK__Regimen__601ADA63C2007AF4_1 PRIMARY KEY NONCLUSTERED (Regimen_Key)
)
go



IF OBJECT_ID('Dim_Regimen') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Regimen >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Regimen >>>'
go

/* 
 * TABLE: Dim_RegistroAuditoria 
 */

CREATE TABLE Dim_RegistroAuditoria(
    RegistroAuditoria_Key    int    IDENTITY(1,1),
	Id_RegistroAuditoria     int    NOT NULL,
    EstadoAuditoria_Key      int    NULL,
    TipoAuditoria_Key        int    NULL,
    FormaAuditoria_Key       int    NULL,
    Declaracion_Key          int    NOT NULL,
    CONSTRAINT PK__Registro__2EAAA2A254E10C2D_1 PRIMARY KEY NONCLUSTERED (RegistroAuditoria_Key)
)
go



IF OBJECT_ID('Dim_RegistroAuditoria') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_RegistroAuditoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_RegistroAuditoria >>>'
go

/* 
 * TABLE: Dim_Time_1 
 */

CREATE TABLE Dim_Time_1(
    TimeKey       int           IDENTITY(1,1),
    Nombre_Mes    varchar(5)    NULL,
    Mes           tinyint       NULL,
    Anio          char(4)       NULL,
    Fecha         datetime      NULL,
    CONSTRAINT PK20_1 PRIMARY KEY NONCLUSTERED (TimeKey)
)
go



IF OBJECT_ID('Dim_Time_1') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Time_1 >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Time_1 >>>'
go

/* 
 * TABLE: Dim_TipoAdeudo 
 */

CREATE TABLE Dim_TipoAdeudo(
    TipoAdeudo_Key    int             IDENTITY(1,1),
    Id_TipoAdeudo     int             NOT NULL,
    TipoAdeudo        varchar(100)    NULL,
    CONSTRAINT PK__TipoAdeu__B710ED8877FF8E18 PRIMARY KEY NONCLUSTERED (TipoAdeudo_Key)
)
go



IF OBJECT_ID('Dim_TipoAdeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_TipoAdeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_TipoAdeudo >>>'
go

/* 
 * TABLE: Dim_TipoAuditoria 
 */

CREATE TABLE Dim_TipoAuditoria(
    TipoAuditoria_Key    int             IDENTITY(1,1),
    Id_TipoAuditoria     int             NOT NULL,
    TipoAuditoria        varchar(100)    NULL,
    CONSTRAINT PK__TipoAudi__260A02A032BC2E5E_1 PRIMARY KEY NONCLUSTERED (TipoAuditoria_Key)
)
go



IF OBJECT_ID('Dim_TipoAuditoria') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_TipoAuditoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_TipoAuditoria >>>'
go

/* 
 * TABLE: FT_Detalle_Adeudo 
 */

CREATE TABLE FT_Detalle_Adeudo(
    TimeKey                  int      NOT NULL,
    EstadoAdeudo_Key         int      NOT NULL,
    MotivoAdeudo_Key         int      NOT NULL,
    TipoAdeudo_Key           int      NOT NULL,
    Declaracion_Key          int      NOT NULL,
    RegistroAuditoria_Key    int      NOT NULL,
    Monto                    float    NOT NULL,
    CONSTRAINT PK24 PRIMARY KEY NONCLUSTERED (TimeKey, EstadoAdeudo_Key, MotivoAdeudo_Key, TipoAdeudo_Key, Declaracion_Key, RegistroAuditoria_Key)
)
go



IF OBJECT_ID('FT_Detalle_Adeudo') IS NOT NULL
    PRINT '<<< CREATED TABLE FT_Detalle_Adeudo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FT_Detalle_Adeudo >>>'
go

/* 
 * TABLE: Dim_Declaracion 
 */

ALTER TABLE Dim_Declaracion ADD CONSTRAINT FK__Declaraci__Id_Ad__4BAC3F29 
    FOREIGN KEY (Aduana_Key)
    REFERENCES Dim_Aduana(Aduana_Key)
go

ALTER TABLE Dim_Declaracion ADD CONSTRAINT FK__Declaraci__Id_Es__4E88ABD4 
    FOREIGN KEY (EstadoDeclaracion_Key)
    REFERENCES Dim_Estado_Declaracion(EstadoDeclaracion_Key)
go

ALTER TABLE Dim_Declaracion ADD CONSTRAINT FK__Declaraci__Id_Re__4D94879B 
    FOREIGN KEY (Regimen_Key)
    REFERENCES Dim_Regimen(Regimen_Key)
go


/* 
 * TABLE: Dim_RegistroAuditoria 
 */

ALTER TABLE Dim_RegistroAuditoria ADD CONSTRAINT RefDim_Declaracion59 
    FOREIGN KEY (Declaracion_Key)
    REFERENCES Dim_Declaracion(Declaracion_Key)
go

ALTER TABLE Dim_RegistroAuditoria ADD CONSTRAINT FK__RegistroA__Id_Es__5AEE82B9 
    FOREIGN KEY (EstadoAuditoria_Key)
    REFERENCES Dim_EstadoAuditoria(EstadoAuditoria_Key)
go

ALTER TABLE Dim_RegistroAuditoria ADD CONSTRAINT FK__RegistroA__Id_Fo__59FA5E80 
    FOREIGN KEY (FormaAuditoria_Key)
    REFERENCES Dim_FormaAuditoria(FormaAuditoria_Key)
go

ALTER TABLE Dim_RegistroAuditoria ADD CONSTRAINT FK__RegistroA__Id_Ti__59063A47 
    FOREIGN KEY (TipoAuditoria_Key)
    REFERENCES Dim_TipoAuditoria(TipoAuditoria_Key)
go


/* 
 * TABLE: FT_Detalle_Adeudo 
 */

ALTER TABLE FT_Detalle_Adeudo ADD CONSTRAINT RefDim_Declaracion53 
    FOREIGN KEY (Declaracion_Key)
    REFERENCES Dim_Declaracion(Declaracion_Key)
go

ALTER TABLE FT_Detalle_Adeudo ADD CONSTRAINT RefDim_RegistroAuditoria54 
    FOREIGN KEY (RegistroAuditoria_Key)
    REFERENCES Dim_RegistroAuditoria(RegistroAuditoria_Key)
go

ALTER TABLE FT_Detalle_Adeudo ADD CONSTRAINT RefDim_TipoAdeudo55 
    FOREIGN KEY (TipoAdeudo_Key)
    REFERENCES Dim_TipoAdeudo(TipoAdeudo_Key)
go

ALTER TABLE FT_Detalle_Adeudo ADD CONSTRAINT RefDim_EstadoAdeudo56 
    FOREIGN KEY (EstadoAdeudo_Key)
    REFERENCES Dim_EstadoAdeudo(EstadoAdeudo_Key)
go

ALTER TABLE FT_Detalle_Adeudo ADD CONSTRAINT RefDim_MotivoAdeudo57 
    FOREIGN KEY (MotivoAdeudo_Key)
    REFERENCES Dim_MotivoAdeudo(MotivoAdeudo_Key)
go

ALTER TABLE FT_Detalle_Adeudo ADD CONSTRAINT RefDim_Time_158 
    FOREIGN KEY (TimeKey)
    REFERENCES Dim_Time_1(TimeKey)
go


