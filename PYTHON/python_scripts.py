import os 
#### carpeta dataset ####
location = 'C:/Users/joaar/OneDrive/Escritorio/PROYECTO PARCIAL/PYTHON/DATASET'
###validar si existe###
if not os.path.exists(location): ##carpeta no existe 
    ##si no existe
    os.mkdir(location)
else: ##si si existe
    ##borrar contenido
    for root, dirs, files in os.walk(location,topdown=False):
        for name in files: 
            os.remove(os.path.join(root,name)) ##eliminar los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name)) #eliminar carpetas
###importar libreria API Kaggle##
from kaggle.api.kaggle_api_extended import KaggleApi

###autenticarnos###
api = KaggleApi()
api.authenticate()

###Descargar Dataset###
#print(api.dataset_list(search='')) ##listo las base de datos disponibles para descargar

#api.dataset_download_files('rahulvyasm/netflix-movies-and-tv-shows','players_3120.csv',path=location,force=True,quiet=False,unzip=True)
api.dataset_download_files('rahulvyasm/netflix-movies-and-tv-shows',path=location,force=True,quiet=False,unzip=True)



