terraform { 
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "3.3.0"
    }
  }
}

provider "cloudflare" {
  email   = var.CLOUDFLARE_EMAIL
  api_key = var.CLOUDFLARE_API_KEY
}

variable "CLOUDFLARE_EMAIL" {
  type = string
}

variable "CLOUDFLARE_API_KEY" {
  type = string
}

variable "domain" {
  default = "at8.online"
}

resource "cloudflare_zone" "at8_zone" {
    zone = var.domain
}

# variable "zone_id" {
#   default = "29f2b4cd7c49f11c566139f005429816"
# }

variable "worker_script_name" {
  default = "at8group_api"
}


resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.at8_zone.id
  name    = "www"
  value   = "at8-group.pages.dev"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "root_domain" {
  zone_id = cloudflare_zone.at8_zone.id
  name    = "@"
  value   = "at8-group.pages.dev"
  type    = "CNAME"
  proxied = true
}

### Mail RESTRICTIVE scenario
resource "cloudflare_record" "at8_mail_domain" {
  zone_id = cloudflare_zone.at8_zone.id
  name    = var.domain
  value   = "v=spf1 -all"
  type    = "TXT"
}

resource "cloudflare_record" "at8_mail_dmarc" {
  zone_id = cloudflare_zone.at8_zone.id
  name    = "_dmarc"
  value   = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s;"
  type    = "TXT"
}

resource "cloudflare_record" "at8_mail_domainkey" {
  zone_id = cloudflare_zone.at8_zone.id
  name    = "*._domainkey"
  value   = "v=DKIM1; p="
  type    = "TXT"
}

### Mail RESTRICTIVE scenario
# resource "cloudflare_worker_script" "api" {
#   name = var.worker_script_name
#   content = file("../at8_api/dist/worker.js")
# }

resource "cloudflare_worker_route" "auth_route" {
  zone_id = cloudflare_zone.at8_zone.id
  pattern = "${var.domain}/auth/*"
  script_name = var.worker_script_name
}

resource "cloudflare_worker_route" "api_route" {
  zone_id = cloudflare_zone.at8_zone.id
  pattern = "${var.domain}/api/*"
  script_name = var.worker_script_name
}

