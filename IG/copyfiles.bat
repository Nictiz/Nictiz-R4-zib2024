@ECHO OFF

mkdir input\resources
mkdir input\vocabulary
del /q input\resources
del /q input\vocabulary
copy ..\zib\StructureDefinitions\*.xml input\resources
copy ..\zib\vocabulary\manual\*.xml input\vocabulary
copy ..\zib\vocabulary\manual\*.xml input\generated