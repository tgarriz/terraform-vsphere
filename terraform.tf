variable "proveedor" {
    description = "Parametros para validar en el vcenter"
    type = map(string)
    default = {
        user = "juan.garriz"
        pass = "Joaquina2010"
        server = "vcenter508.arba.gov.ar"
    }
}