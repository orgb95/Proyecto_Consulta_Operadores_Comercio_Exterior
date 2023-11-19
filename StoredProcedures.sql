Use Consulta_Operadores_Comercio_Exterior_DW
go

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_Aduana'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_Aduana]
GO

Create Procedure sp_Fill_Dim_Aduana As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_Aduana ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Aduana] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[Aduana] AS SOURCE
ON Target.Id_Aduana = SOURCE.Id_Aduana
WHEN MATCHED AND Target.Aduana <> SOURCE.Aduana
THEN UPDATE SET Target.Aduana = SOURCE.Aduana

WHEN NOT MATCHED BY Target
THEN INSERT (Id_Aduana, Aduana)
VALUES (Source.Id_Aduana, Source.Aduana)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.Aduana AS T_Aduana

, INSERTED.Aduana AS S_Aduana
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[Aduana]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Aduana]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_Regimen'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_Regimen]
GO

Create Procedure sp_Fill_Dim_Regimen As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_Regimen ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Regimen] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[Regimen] AS SOURCE
ON Target.Id_Regimen = SOURCE.Id_Regimen
WHEN MATCHED AND Target.Regimen <> SOURCE.Regimen
THEN UPDATE SET Target.Regimen = SOURCE.Regimen

WHEN NOT MATCHED BY Target
THEN INSERT (Id_Regimen, Regimen)
VALUES (Source.Id_Regimen, Source.Regimen)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.Regimen AS T_Regimen

, INSERTED.Regimen AS S_Regimen
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[Regimen]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Regimen]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_Estado_Declaracion'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_Estado_Declaracion]
GO

Create Procedure sp_Fill_Dim_Estado_Declaracion As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_Estado_Declaracion ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Estado_Declaracion] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[Estado_Declaracion] AS SOURCE
ON Target.Id_EstadoDeclaracion = SOURCE.Id_EstadoDeclaracion
WHEN MATCHED AND Target.Estado <> SOURCE.Estado
THEN UPDATE SET Target.Estado = SOURCE.Estado

WHEN NOT MATCHED BY Target
THEN INSERT (Id_EstadoDeclaracion, Estado)
VALUES (Source.Id_EstadoDeclaracion, Source.Estado)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.Estado AS T_Estado

, INSERTED.Estado AS S_Estado
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[Estado_Declaracion]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Estado_Declaracion]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_Declaracion'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_Declaracion]
GO

Create Procedure sp_Fill_Dim_Declaracion As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_Declaracion ...';

With CTE_SOURCE AS (
	Select D.Id_Declaracion, D.Id_Usuario,U.Nombre as Nombre_Usuario, RDS.Tipo_Razon as TipoRazon_Usuario, TE.Estado as Estado_Usuario, TAE.Actividad as ActividadEconomica_Usuario, U.Domicilio as Domicilio_Usuario, U.Telefono, U.Correo AS Correo_Usuario,DA.Aduana_Key, DR.Regimen_Key, DED.EstadoDeclaracion_Key
	from [Consulta_Operadores_Comercio_Exterior].[dbo].[Declaracion] as D Join
		 [Consulta_Operadores_Comercio_Exterior].[dbo].[Usuario] as U on D.Id_Usuario = U.RUC JOIN
		 [Consulta_Operadores_Comercio_Exterior].[dbo].[RazonDenominacionSocial] AS RDS ON U.Id_TipoRazon = RDS.Id_TipoRazon JOIN
		 [Consulta_Operadores_Comercio_Exterior].[dbo].[TipoEstado] as TE on U.Id_TipoEstado = TE.Id_TipoEstado JOIN
		 [Consulta_Operadores_Comercio_Exterior].[dbo].[TipoActividadEconomica] as TAE on U.Id_TipoActividad = TAE.Id_TipoActividad JOIN
 		 [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Aduana] DA on D.Id_Aduana = DA.Id_Aduana Join
		 [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Regimen] DR on D.Id_Regimen = DR.Id_Regimen Join
		 [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Estado_Declaracion] DED on D.Id_EstadoDeclaracion = DED.Id_EstadoDeclaracion
	
	
)


MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Declaracion] AS Target
USING CTE_SOURCE AS SOURCE
ON Target.Id_Declaracion = SOURCE.Id_Declaracion
WHEN MATCHED AND Target.Nombre_Usuario <> SOURCE.Nombre_Usuario
				or Target.Domicilio_Usuario <> SOURCE.Domicilio_Usuario
				or Target.Telefono <> SOURCE.Telefono
				or Target.Correo_Usuario <> SOURCE.Correo_Usuario
THEN UPDATE SET Target.Nombre_Usuario = SOURCE.Nombre_Usuario
				, Target.Domicilio_Usuario = SOURCE.Domicilio_Usuario
				, Target.Telefono = SOURCE.Telefono
				, Target.Correo_Usuario = SOURCE.Nombre_Usuario

WHEN NOT MATCHED BY Target
THEN INSERT (Id_Declaracion, Id_Usuario, Nombre_Usuario, TipoRazon_Usuario, Estado_Usuario, ActividadEconomica_Usuario, Domicilio_Usuario, Telefono ,Correo_Usuario, Aduana_Key, Regimen_Key, EstadoDeclaracion_Key)
VALUES (SOURCE.Id_Declaracion, SOURCE.Id_Usuario, SOURCE.Nombre_Usuario, SOURCE.TipoRazon_Usuario, SOURCE.Estado_Usuario, SOURCE.ActividadEconomica_Usuario, SOURCE.Domicilio_Usuario, SOURCE.TELEFONO,SOURCE.Correo_Usuario, SOURCE.Aduana_Key, SOURCE.Regimen_Key, SOURCE.EstadoDeclaracion_Key)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.Id_Usuario AS T_Id_Usuario
, DELETED.Nombre_Usuario AS T_Nombre_Usuario
, DELETED.TipoRazon_Usuario as T_TipoRazon_Usuario
, DELETED.Estado_Usuario as T_Estado_Usuario
, DELETED.ActividadEconomica_Usuario as T_ActividadEconomica_Usuario
, DELETED.Domicilio_Usuario as T_Domicilio_Usuario
, DELETED.Telefono as T_Telefono
, Deleted.Correo_Usuario as T_Correo_Usuario
, DELETED.Aduana_Key as T_Aduana_Key
, DELETED.Regimen_Key as T_Regimen_Key
, DELETED.EstadoDeclaracion_Key as T_EstadoDeclaracion_Key

, INSERTED.Id_Usuario AS S_Id_Usuario
, INSERTED.Nombre_Usuario AS S_Nombre_Usuario
, INSERTED.TipoRazon_Usuario as S_TipoRazon_Usuario
, INSERTED.Estado_Usuario as S_Estado_Usuario
, INSERTED.ActividadEconomica_Usuario as S_ActividadEconomica_Usuario
, INSERTED.Domicilio_Usuario as S_Domicilio_Usuario
, INSERTED.Telefono as S_Telefono
, INSERTED.Correo_Usuario as S_Correo_Usuario
, INSERTED.Aduana_Key as S_Aduana_Key
, INSERTED.Regimen_Key as S_Regimen_Key
, INSERTED.EstadoDeclaracion_Key as S_EstadoDeclaracion_Key
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[Declaracion]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Declaracion]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_EstadoAuditoria'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_EstadoAuditoria]
GO

Create Procedure sp_Fill_Dim_EstadoAuditoria As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_EstadoAuditoria ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_EstadoAuditoria] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[EstadoAuditoria] AS SOURCE
ON Target.Id_EstadoAuditoria = SOURCE.Id_EstadoAuditoria
WHEN MATCHED AND Target.EstadoAuditoria <> SOURCE.EstadoAuditoria
THEN UPDATE SET Target.EstadoAuditoria = SOURCE.EstadoAuditoria

WHEN NOT MATCHED BY Target
THEN INSERT (Id_EstadoAuditoria, EstadoAuditoria)
VALUES (Source.Id_EstadoAuditoria, Source.EstadoAuditoria)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.EstadoAuditoria AS T_EstadoAuditoria

, INSERTED.EstadoAuditoria AS S_EstadoAuditoria
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[EstadoAuditoria]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_EstadoAuditoria]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_TipoAuditoria'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_TipoAuditoria]
GO

Create Procedure sp_Fill_Dim_TipoAuditoria As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_TipoAuditoria ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_TipoAuditoria] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[TipoAuditoria] AS SOURCE
ON Target.Id_TipoAuditoria = SOURCE.Id_TipoAuditoria
WHEN MATCHED AND Target.TipoAuditoria <> SOURCE.TipoAuditoria
THEN UPDATE SET Target.TipoAuditoria = SOURCE.TipoAuditoria

WHEN NOT MATCHED BY Target
THEN INSERT (Id_TipoAuditoria, TipoAuditoria)
VALUES (Source.Id_TipoAuditoria, Source.TipoAuditoria)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.TipoAuditoria AS T_TipoAuditoria

, INSERTED.TipoAuditoria AS S_TipoAuditoria
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[TipoAuditoria]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_TipoAuditoria]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_FormaAuditoria'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_FormaAuditoria]
GO

Create Procedure sp_Fill_Dim_FormaAuditoria As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_FormaAuditoria ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_FormaAuditoria] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[FormaAuditoria] AS SOURCE
ON Target.Id_FormaAuditoria = SOURCE.Id_FormaAuditoria
WHEN MATCHED AND Target.FormaAuditoria <> SOURCE.FormaAuditoria
THEN UPDATE SET Target.FormaAuditoria = SOURCE.FormaAuditoria

WHEN NOT MATCHED BY Target
THEN INSERT (Id_FormaAuditoria, FormaAuditoria)
VALUES (Source.Id_FormaAuditoria, Source.FormaAuditoria)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.FormaAuditoria AS T_FormaAuditoria

, INSERTED.FormaAuditoria AS S_FormaAuditoria
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[FormaAuditoria]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_FormaAuditoria]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_RegistroAuditoria'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_RegistroAuditoria]
GO

Create Procedure sp_Fill_Dim_RegistroAuditoria As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_RegistroAuditoria ...';

With CTE_SOURCE AS (
	Select RA.Id_RegistroAuditoria, EA.EstadoAuditoria_Key, TA.TipoAuditoria_Key, FA.FormaAuditoria_Key, D.Declaracion_Key
	from [Consulta_Operadores_Comercio_Exterior].[dbo].[RegistroAuditoria] as RA Join
		 [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_EstadoAuditoria] as EA on RA.Id_EstadoAuditoria = EA.Id_EstadoAuditoria JOIN
		 [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_TipoAuditoria] as TA on RA.Id_TipoAuditoria = TA.Id_TipoAuditoria JOIN
		 [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_FormaAuditoria] as FA on RA.Id_FormaAuditoria = FA.Id_FormaAuditoria JOIN
		 [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Declaracion] as D on RA.Id_Declaracion = D.Id_Declaracion

	
)


MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_RegistroAuditoria] AS Target
USING CTE_SOURCE AS SOURCE
ON Target.Id_RegistroAuditoria = SOURCE.Id_RegistroAuditoria

WHEN NOT MATCHED BY Target
THEN INSERT (Id_RegistroAuditoria, EstadoAuditoria_Key, TipoAuditoria_Key, FormaAuditoria_Key, Declaracion_Key)
VALUES (SOURCE.Id_RegistroAuditoria, SOURCE.EstadoAuditoria_Key, SOURCE.TipoAuditoria_Key, SOURCE.FormaAuditoria_Key, SOURCE.Declaracion_Key)
WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.EstadoAuditoria_Key AS T_EstadoAuditoria_Key
, DELETED.TipoAuditoria_Key as T_TipoAuditoria_Key
, DELETED.FormaAuditoria_Key as T_FormaAuditoria_Key
, DELETED.Declaracion_Key as T_Declaracion


, INSERTED.EstadoAuditoria_Key AS S_EstadoAuditoria_Key
, INSERTED.TipoAuditoria_Key as S_TipoAuditoria_Key
, INSERTED.FormaAuditoria_Key as S_FormaAuditoria_Key
, INSERTED.Declaracion_Key as S_Declaracion
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[RegistroAuditoria]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_RegistroAuditoria]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_TipoAdeudo'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_TipoAdeudo]
GO

Create Procedure sp_Fill_Dim_TipoAdeudo As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_TipoAdeudo ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_TipoAdeudo] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[TipoAdeudo] AS SOURCE
ON Target.Id_TipoAdeudo = SOURCE.Id_TipoAdeudo
WHEN MATCHED AND Target.TipoAdeudo <> SOURCE.TipoAdeudo
THEN UPDATE SET Target.TipoAdeudo = SOURCE.TipoAdeudo

WHEN NOT MATCHED BY Target
THEN INSERT (Id_TipoAdeudo, TipoAdeudo)
VALUES (Source.Id_TipoAdeudo, Source.TipoAdeudo)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.TipoAdeudo AS T_TipoAdeudo

, INSERTED.TipoAdeudo AS S_TipoAdeudo
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[TipoAdeudo]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_TipoAdeudo]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_MotivoAdeudo'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_MotivoAdeudo]
GO

Create Procedure sp_Fill_Dim_MotivoAdeudo As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_MotivoAdeudo ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_MotivoAdeudo] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[MotivoAdeudo] AS SOURCE
ON Target.Id_MotivoAdeudo = SOURCE.Id_MotivoAdeudo
WHEN MATCHED AND Target.MotivoAdeudo <> SOURCE.MotivoAdeudo
THEN UPDATE SET Target.MotivoAdeudo = SOURCE.MotivoAdeudo

WHEN NOT MATCHED BY Target
THEN INSERT (Id_MotivoAdeudo, MotivoAdeudo)
VALUES (Source.Id_MotivoAdeudo, Source.MotivoAdeudo)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.MotivoAdeudo AS T_MotivoAdeudo

, INSERTED.MotivoAdeudo AS S_MotivoAdeudo
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[MotivoAdeudo]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_MotivoAdeudo]
*/

Go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_EstadoAdeudo'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_EstadoAdeudo]
GO

Create Procedure sp_Fill_Dim_EstadoAdeudo As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_EstadoAdeudo ...'

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_EstadoAdeudo] AS Target
USING [Consulta_Operadores_Comercio_Exterior].[dbo].[EstadoAdeudo] AS SOURCE
ON Target.Id_EstadoAdeudo = SOURCE.Id_EstadoAdeudo
WHEN MATCHED AND Target.EstadoAdeudo <> SOURCE.EstadoAdeudo
THEN UPDATE SET Target.EstadoAdeudo = SOURCE.EstadoAdeudo

WHEN NOT MATCHED BY Target
THEN INSERT (Id_EstadoAdeudo, EstadoAdeudo)
VALUES (Source.Id_EstadoAdeudo, Source.EstadoAdeudo)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.EstadoAdeudo AS T_EstadoAdeudo

, INSERTED.EstadoAdeudo AS S_EstadoAdeudo
;
/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[EstadoAdeudo]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_EstadoAdeudo]
*/

Go


/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_Dim_Time_1'))
   DROP PROCEDURE [dbo].[sp_Fill_Dim_Time_1]
GO

Create Procedure sp_Fill_Dim_Time_1 As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_Dim_Time_1 ...';
With CTE_SOURCE AS (
	SELECT DISTINCT 
    LEFT(CONVERT(varchar, FechaAdeudo, 100), 3) AS [Nombre_Mes],
    CAST(DATEPART(mm, FechaAdeudo) AS tinyint) AS [Mes],
    CAST(DATEPART(yyyy, FechaAdeudo) AS char(4)) AS [Anio],
    FechaAdeudo AS Fecha
	FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[RegistroAdeudo]
	WHERE FechaAdeudo IS NOT NULL
)
MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Time_1] AS target
USING CTE_SOURCE AS SOURCE
ON target.[Fecha] = SOURCE.[Fecha]

WHEN NOT MATCHED BY Target
THEN INSERT (Nombre_Mes, Mes, Anio, Fecha)
VALUES (SOURCE.[Nombre_Mes], SOURCE.[Mes], SOURCE.[Anio], SOURCE.[Fecha])

WHEN NOT MATCHED BY SOURCE
THEN DELETE
;

/*
SELECT * FROM [Consulta_Operadores_Comercio_Exterior].[dbo].[RegistroAdeudo]
SELECT * FROM [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Time_1]
*/
go

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_FT_Detalle_Adeudo'))
   DROP PROCEDURE [dbo].[sp_Fill_FT_Detalle_Adeudo]
GO

Create Procedure sp_Fill_FT_Detalle_Adeudo As
PRINT REPLICATE('-', 70)
PRINT 'Procesando sp_Fill_FT_Detalle_Adeudo...';
With CTE_SOURCE AS (
	Select DT1.TimeKey, DEA.EstadoAdeudo_Key, DMA.MotivoAdeudo_Key, DTA.TipoAdeudo_Key, DD.Declaracion_Key, DRA.RegistroAuditoria_Key, FDA.Monto
 From [Consulta_Operadores_Comercio_Exterior].[dbo].[FT_Detalle_Adeudo] AS FDA JOIN 
[Consulta_Operadores_Comercio_Exterior].[dbo].[RegistroAdeudo] AS RA on FDA.Id_RegistroAdeudo = RA.Id_RegistroAdeudo join
[Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Time_1] AS DT1 ON RA.FechaAdeudo = DT1.Fecha JOIN
[Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_EstadoAdeudo] AS DEA ON RA.Id_EstadoAdeudo = DEA.Id_EstadoAdeudo join
[Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_MotivoAdeudo] as DMA ON RA.Id_MotivoAdeudo = DMA.Id_MotivoAdeudo join
[Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_TipoAdeudo] as DTA on RA.Id_TipoAdeudo = DTA.Id_TipoAdeudo join
[Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_Declaracion] as DD ON RA.Id_Declaracion = DD.Id_Declaracion join
[Consulta_Operadores_Comercio_Exterior_DW].[dbo].[Dim_RegistroAuditoria] as DRA ON RA.Id_RegistroAuditoria = DRA.Id_RegistroAuditoria
GROUP BY DT1.TimeKey, DEA.EstadoAdeudo_Key, DMA.MotivoAdeudo_Key, DTA.TipoAdeudo_Key, DD.Declaracion_Key, DRA.RegistroAuditoria_Key, FDA.Monto
)

MERGE [Consulta_Operadores_Comercio_Exterior_DW].[dbo].[FT_Detalle_Adeudo] AS target
USING CTE_SOURCE AS SOURCE
ON target.TimeKey = SOURCE.TimeKey
	And target.EstadoAdeudo_Key = SOURCE.EstadoAdeudo_Key
	And target.MotivoAdeudo_Key = SOURCE.MotivoAdeudo_Key
	And target.TipoAdeudo_Key = SOURCE.TipoAdeudo_Key
	And target.Declaracion_Key = SOURCE.Declaracion_Key
	And target.RegistroAuditoria_Key = SOURCE.RegistroAuditoria_Key
	
WHEN MATCHED AND target.Monto <> SOURCE.Monto

THEN UPDATE SET target.Monto = SOURCE.Monto

WHEN NOT MATCHED BY Target
THEN INSERT (TimeKey, EstadoAdeudo_Key, MotivoAdeudo_Key, TipoAdeudo_Key, Declaracion_Key, RegistroAuditoria_Key, Monto)
VALUES (SOURCE.TimeKey, SOURCE.EstadoAdeudo_Key, SOURCE.MotivoAdeudo_Key, SOURCE.TipoAdeudo_Key, SOURCE.Declaracion_Key, SOURCE.RegistroAuditoria_Key, SOURCE.Monto)

WHEN NOT MATCHED BY SOURCE
THEN DELETE

OUTPUT $action
, DELETED.Monto AS T_Monto

, INSERTED.Monto AS T_Monto

;

/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
/* ==================== ==================== ==================== ==================== ==================== */
go
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND OBJECT_ID = OBJECT_ID('dbo.sp_Fill_All'))
   DROP PROCEDURE [dbo].[sp_Fill_All]
GO

CREATE PROCEDURE [dbo].[sp_Fill_All] AS

TRUNCATE TABLE [dbo].[FT_Detalle_Adeudo]

EXECUTE dbo.sp_Fill_Dim_Aduana
EXECUTE dbo.sp_Fill_Dim_Regimen
EXECUTE dbo.sp_Fill_Dim_Estado_Declaracion
EXECUTE dbo.sp_Fill_Dim_Declaracion
EXECUTE dbo.sp_Fill_Dim_EstadoAuditoria
EXECUTE dbo.sp_Fill_Dim_TipoAuditoria
EXECUTE dbo.sp_Fill_Dim_FormaAuditoria
EXECUTE dbo.sp_Fill_Dim_RegistroAuditoria
EXECUTE dbo.sp_Fill_Dim_TipoAdeudo
EXECUTE dbo.sp_Fill_Dim_MotivoAdeudo
EXECUTE dbo.sp_Fill_Dim_EstadoAdeudo
EXECUTE dbo.sp_Fill_Dim_Time_1
EXECUTE dbo.sp_Fill_FT_Detalle_Adeudo



go