package server

import (
	"context"
	"log"

	"google.golang.org/grpc"
)

func LoggerInterceptor(
	ctx context.Context,
	req interface{},
	info *grpc.UnaryServerInfo,
	handler grpc.UnaryHandler,
) (resp interface{}, err error) {
	log.Printf("%v", info.FullMethod)
	return handler(ctx, req)
}
