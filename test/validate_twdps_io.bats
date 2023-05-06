#!/usr/bin/env bats

@test "evaluate cdicohorts-eight ingress" {
  run bash -c "curl https://httpbin.${CLUSTER}.cdicohorts-eight.com/status/418"
  [[ "${output}" =~ "-=[ teapot ]=-" ]]
}

@test "evaluate cdicohorts-eight.com certificate" {
  run bash -c "curl --cert-status -v https://httpbin.${CLUSTER}.cdicohorts-eight.com/status/418"
  [[ "${output}" =~ "SSL certificate verify ok" ]]
}
