package ports

import (
	"smct/backend/internal/core/domain"
)

type UserReposotory interface {
	Get(username string) (*domain.User, error)
	Save(user *domain.User) error
	Delete(user *domain.User) error
}

type ResultRepository interface {
	Get(gameType, gameMode, username string) (*domain.Result, error)
	GetRange(gameType, gameMode string, start, end int) ([]domain.Result, error)
	Save(result *domain.Result) error
}

type TutorialRepository interface {
	Get(gameType, gameMode, title string) (*domain.Tutorial, error)
	GetTitles(gameType, gameMode string) ([]string, error)
}
