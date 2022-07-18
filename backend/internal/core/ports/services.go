package ports

import (
	domain "smct/backend/internal/core/domain"
	"time"
)

type UserService interface {
	Create(username, password string) (*domain.User, error)
	Save(user *domain.User) error
	Get(username string) (*domain.User, error)
	Delete(username string) error
}

type ResultService interface {
	Create(gameType, gameMode, scores, username string, lvl int) (*domain.Result, error)
	Save(result *domain.Result) error
	Get(gameType, gameMode, username string) (*domain.Result, error)
	Delete(gameType, gameMody, username string) error
}

type TutorialService interface {
	Create(gameType, gameMode, title, body string, reference []string, time time.Time) (*domain.Tutorial, error)
	Save(tutorial *domain.Tutorial) error
	Get(gameType, gameMode, title string) (*domain.Tutorial, error)
	GetTitles(gameType, gameMode string) ([]string, error)
	Delete(gameType, gameMody, title string) error
}

type AuthorizationService interface {
	CreateToken(username string) (*domain.Token, error)
	CheckToken(token *domain.Token) (bool, error)
	DeleteToken(token *domain.Token) error
}
