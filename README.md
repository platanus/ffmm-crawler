# FFMM Crawler

Crawler for the mutual fund data in AAFM site (aafm.cl) to retrieve historic daily share values.

## Navigator:

The crawler navigator is called

> nav :valor_cuota_diaria

## Parameters:

Query params are the same that in AAFM search site http://www.aafm.cl/estadisticas_publico/estadisticas.php and are passed directly to the URL as HTTP GET params for the request

**administradora:** Rut of the institution

**tipo:**

    "%": All types
    "1": FM DE INV.EN INST.DE DEUDA DE C/P CON DURACION <= 90 DIAS
    "2": FM DE INV.EN INST.DE DEUDA DE C/P CON DURACION <= 365 DIAS
    "3": FM DE INV.EN INST.DE DEUDA DE MEDIANO Y LARGO PLAZO
    "4": FM MIXTO
    "5": FM DE INVERSION EN INSTRUMENTOS DE CAPITALIZACION
    "6": FM DE LIBRE INVERSION
    "7": FM ESTRUCTURADO
    "8": FM DIRIGIDO A INVERSIONISTAS CALIFICADOS



**dia, mes, anio:** Date for the query, splitted in 3 params

**inversion:**
        "N": National,
        "I": International,
        "%": Both,



## Usage Examples:

    > nav :valor_cuota_diaria, administradora: '96767630', tipo: '%', dia: '1', mes: '2', anio: '2016', inversion: 'N'

Retrieves data from https://www.aafm.cl/estadisticas_publico/valor_cuota_diaria.php?consulta=4&administradora=96767630&tipo=%&dia=1&dia2=&mes=1&mes2=&anio=2016&anio2=&orden=1&inversion=N



    > nav :valor_cuota_diaria, administradora: '96836390', tipo: '1', dia: '3', mes: '3', anio: '2016', inversion: '%'

http://www.aafm.cl/estadisticas_publico/valor_cuota_diaria.php?consulta=4&administradora=96836390&tipo=1&dia=3&dia2=&mes=3&mes2=&anio=2016&anio2=&orden=1&inversion=%

    > nav :valor_cuota_diaria, administradora: '99558780', tipo: '4', dia: '3', mes: '3', anio: '2016', inversion: '%'

http://www.aafm.cl/estadisticas_publico/valor_cuota_diaria.php?consulta=4&administradora=99558780&tipo=4&dia=3&dia2=&mes=3&mes2=&anio=2016&anio2=&orden=1&inversion=%

## Output:

The reducer returns an array of type ShareValues

    class ShareValue
        string: institution
        string: run
        string: fund
        string: serie
        string: date
        float: value