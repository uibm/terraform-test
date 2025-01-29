module "region_us_east" {
  source = "./modules/region"

  prefix = var.prefix
  region = "us-east"

  providers = {
    ibm = ibm.us-east
  }
}

module "region_us_south" {
  source = "./modules/region"

  prefix = var.prefix
  region = "us-south"

  providers = {
    ibm = ibm.us-south
  }
}

module "region_au_syd" {
  source = "./modules/region"

  prefix = var.prefix
  region = "au-syd"

  providers = {
    ibm = ibm.au-syd
  }
}

module "region_jp_osa" {
  source = "./modules/region"

  prefix = var.prefix
  region = "jp-osa"

  providers = {
    ibm = ibm.jp-osa
  }
}

module "region_ca_tor" {
  source = "./modules/region"

  prefix = var.prefix
  region = "ca-tor"

  providers = {
    ibm = ibm.ca-tor
  }
}

module "region_eu_es" {
  source = "./modules/region"

  prefix = var.prefix
  region = "eu-es"

  providers = {
    ibm = ibm.eu-es
  }
}

module "region_eu_de" {
  source = "./modules/region"

  prefix = var.prefix
  region = "eu-de"

  providers = {
    ibm = ibm.eu-de
  }
}

module "region_br_sao" {
  source = "./modules/region"

  prefix = var.prefix
  region = "br-sao"

  providers = {
    ibm = ibm.br-sao
  }
}

module "region_eu_gb" {
  source = "./modules/region"

  prefix = var.prefix
  region = "eu-gb"

  providers = {
    ibm = ibm.eu-gb
  }
}

module "region_jp_tok" {
  source = "./modules/region"

  prefix = var.prefix
  region = "jp-tok"

  providers = {
    ibm = ibm.jp-tok
  }
}