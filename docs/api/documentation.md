FORMAT: 1A
HOST: http://localhost:3000

# Medical Procedure Search API
This API describes how to use /search endpoint

## Group MedicalProcedures

## MedicalProcedures Collection [/api/v1/medical_procedures/search{?q}{&p}]

### Search MedicalProcedures [GET]

+ Parameters
    + q: `surgical` (string, required) - Query string
    + p: 1 (number, required) - Page to return
+ Request
    + Headers
        
            Content-Type: application/json

+ Response 200 (application/json)
    + Attributes (array[MedicalProcedureRoot])
               
+ Response 400 (application/json)
    + Attributes (object)
        + code: `400` (number)
        + message: `Bad request`


## Data Structures
        
### MedicalProcedureRoot
+ id: 1 (number, required) - Entry ID
+ name: `Shock therapy` (string, required) - Name of the procedure
+ linked (array[MedicalProcedureChild]) - Connected to search term procedures in terms of procedure type

### MedicalProcedureChild
+ id: 2 (number, required) - Entry ID
+ name: `Insulin shock therapy` (string, required) - Name of the procedure
+ linked (array[]) - Connected to search term procedures in terms of procedure type