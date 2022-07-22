package token_repository

import (
	"context"
	"smct/backend/internal/core/domain"

	"github.com/go-redis/redis/v9"
)

type TokenRepository struct {
	db *redis.Client
}

func NewTokenRepository() *TokenRepository {
	rdb := redis.NewClient(
		&redis.Options{
			Addr:     "localhost:6379",
			Password: "",
			DB:       1,
		},
	)
	return &TokenRepository{db: rdb}
}

func (s *TokenRepository) Get(username string) (*domain.Token, error) {
	ctx := context.Background()
	val, err := s.db.Get(ctx, username).Result()
	if err != nil {
		return nil, err
	}
	token := domain.Token(val)
	return &token, nil
}

func (s *TokenRepository) Save(username string, token *domain.Token) error {
	ctx := context.Background()
	err := s.db.Set(ctx, username, token, 0).Err()
	return err
}

func (s *TokenRepository) Delete(username string, token *domain.Token) error {
	ctx := context.Background()
	err := s.db.Del(ctx, username).Err()
	return err
}
