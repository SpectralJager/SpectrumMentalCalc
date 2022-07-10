genProto:
	protoc --go_out=pkg/grpc/pb --go-grpc_out=pkg/grpc/pb pkg/grpc/proto/*.proto

run:
	go run cmd/main.go

test:
	go test ./pkg/...

