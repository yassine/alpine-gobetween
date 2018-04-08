# alpine-gobetween
![Build Status](https://www.travis-ci.org/yassine/alpine-gobetween.svg)
Minimalistic gobetween docker container

#### Usage
`docker pull yassine/alpine-gobetween`

#### Configuration

Configuration is passed through environment variables:

ENV Variable | Description | Default
--- | --- | ---
*GOBETWEEN_API_ENABLE* | Enable/Disable the REST Api | true
*GOBETWEEN_API_BIND_ADDRESS* | The binding address for the API | All addresses & All interfaces
*GOBETWEEN_API_BIND_PORT* | The port on which API server listens | 9000
*GOBETWEEN_API_LOGIN* | The username to use for basic authentication  | none (no authentication required)
*GOBETWEEN_API_PASSWORD* | The password to use for basic authentication | none (no authentication required)
*GOBETWEEN_API_CERT_PATH* | The certificate to use for tls authentication | none (no authentication required)
*GOBETWEEN_API_KEY_PATH* | The private key to use for tls authentication | none (no authentication required)