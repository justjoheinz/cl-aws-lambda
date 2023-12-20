(in-package :cl-user)

(uiop:define-package example-lambda/tests
  (:use #:cl #:rove))

(in-package :example-lambda/tests)

(defvar *sample-request*
  '(("isBase64Encoded")
    ("requestContext"
     ("timeEpoch" . 1703075759728)
     ("time" . "20/Dec/2023:12:35:59 +0000")
     ("stage" . "$default")
     ("routeKey" . "$default")
     ("requestId" . "4d1b6cca-3804-41ae-aac3-48b348ebd677")
     ("http"
      ("userAgent"          . "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")         ("sourceIp" . "109.42.113.218") ("protocol" . "HTTP/1.1")         ("path" . "/") ("method" . "GET"))        ("domainPrefix" . "foxl2czchfw2wqkeaerlpitg2u0hunxm")
     ("domainName"         . "foxl2czchfw2wqkeaerlpitg2u0hunxm.lambda-url.eu-central-1.on.aws")
     ("apiId" . "foxl2czchfw2wqkeaerlpitg2u0hunxm")
     ("accountId" . "anonymous"))
    ("headers"
     ("user-agent"       . "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
     ("sec-fetch-dest"   . "document")
     ("accept-encoding"  . "gzip, deflate, br")
     ("upgrade-insecure-requests" . "1")
     ("host"             . "foxl2czchfw2wqkeaerlpitg2u0hunxm.lambda-url.eu-central-1.on.aws")
     ("sec-ch-ua-platform" . "macOS")
     ("x-amzn-trace-id"  . "Root=1-6582dfaf-42805ebc6e55e93142d32a28")
     ("sec-ch-ua-mobile" . "?0")
     ("x-test"           . "some-test")
     ("sec-ch-ua"        . "some-test")
     ("x-amzn-tls-cipher-suite" . "ECDHE-RSA-AES128-GCM-SHA256")
     ("accept"           . "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7")
     ("sec-fetch-user"   . "?1")
     ("x-forwarded-for"  . "109.42.113.218")
     ("x-forwarded-port" . "443")
     ("x-forwarded-proto". "https")
     ("accept-language"  . "de,en;q=0.9,de-DE;q=0.8,en-US;q=0.7,fr;q=0.6")
     ("sec-fetch-site"   . "none")
     ("x-amzn-tls-version" . "TLSv1.2")
     ("sec-fetch-mode"   . "navigate"))
    ("rawQueryString"    . "")
    ("rawPath" . "/")
    ("routeKey" . "$default")
    ("version" . "2.0"))
  )

(deftest env-conversion
  (ok t t))

(run-suite *package*)
