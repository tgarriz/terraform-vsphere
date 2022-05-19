variable "proveedor" {
    description = "Parametros para validar en el vcenter"
    type = map(string)
    default = {
        user = ""
        pass = ""
        server = "vcenter508.arba.gov.ar"
    }
}