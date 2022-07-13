package db

import (
	"context"

	redis "github.com/go-redis/redis/v8"
)

func CreateConnection(addr string, password string, database int) (*redis.Client, error) {
	rdb := redis.NewClient(
		&redis.Options{
			Addr:     addr,
			Password: password,
			DB:       database,
		},
	)
	ctx := context.Background()
	err := rdb.Set(ctx, "Test", "test", 0).Err()
	if err != nil {
		return nil, err
	}
	rdb.GetDel(ctx, "Test").Err()
	if err != nil {
		return nil, err
	}
	return rdb, nil
}
