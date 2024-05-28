USE Kaggle
GO

--EN CASO NO EXISTA LA TABLA netflix
If NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id = OBJECT_ID(N'dbo.netflix') AND type='U')
	CREATE TABLE netflix(
		show_id VARCHAR(MAX),
		type_show VARCHAR(MAX),
		tittle VARCHAR(MAX),
		director VARCHAR(MAX),
		cast_show VARCHAR(MAX),
		country VARCHAR(MAX),
		date_added VARCHAR(MAX),
		release_year VARCHAR(MAX),
		rating VARCHAR(MAX),
		duration VARCHAR(MAX),
		listed_in VARCHAR(MAX),
		description_show VARCHAR(MAX),
	)

--SI LA TABLA Y EXISTE ENTONCES LA TRUNCO
TRUNCATE TABLE  dbo.netflix

--INGESTAR DATASET
BULK INSERT dbo.netflix
FROM 'C:\Users\joaar\OneDrive\Escritorio\PROYECTO PARCIAL\PYTHON\DATASET\netflix_titles.csv'
WITH 
(
	FIRSTROW = 2, --empieza en la 2da fila, ya que la 1era es la cabecera
	FIELDTERMINATOR = ',', --indicamos el separador de las columnas
	ROWTERMINATOR = '0x0a' --referencia a un salto de linea
)

GO
