# grpc-web-sidecar

Envoy proxy configured to provide gRPC-web support for any gRPC service.

This container is intended to be used primarily within a Kubernetes pod alongside a gRPC service, hence the default gRPC service address of `127.0.0.1`; but it can be configured for various other setups.

### Configuration

| Environment variable | Default value |
|----------------------|---------------|
|`ENVOY_ADMIN_ADDRESS` | 127.0.0.1     |
|`ENVOY_ADMIN_PORT`    | 9901          |
|`GRPC_WEB_ADDRESS`    | 0.0.0.0       |
|`GRPC_WEB_PORT`       | 8082          |
|`GRPC_SERVICE_ADDRESS`| 127.0.0.1     |
|`GRPC_SERVICE_PORT`   | 8080          |
