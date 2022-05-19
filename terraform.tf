variable "proveedor" {
  description = "Parametros para validar en el vcenter"
  type        = map(string)
  default = {
    user   = "pepe"
    pass   = "pepe"
    server = "vcenter508.arba.gov.ar"
  }
}