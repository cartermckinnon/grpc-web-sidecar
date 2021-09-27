FROM envoyproxy/envoy:v1.19-latest
WORKDIR /home/envoy/
COPY envoy.yaml .
COPY configure-and-run.sh .
CMD ["./configure-and-run.sh", "envoy.yaml"]
