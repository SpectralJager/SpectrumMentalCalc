package ports

import (
	domain "smct/backend/internal/core/domain"
	"time"
)

type UserService interface {
	Create(username, password string) (*domain.User, error)
	Update(newUser, oldUser *domain.User) error
	Get(username string) (*domain.User, error)
	Delete(user *domain.User) error
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

type Authentication interface {
	CreateToken(username string) (*domain.Token, error)
	GetToken(username string) (*domain.Token, error)
	CheckToken(username string, token *domain.Token) (bool, error)
	DeleteToken(username string, token *domain.Token) error
}

type Authorization interface {
	Login(user *domain.User) (*domain.Token, error)
	Register(user *domain.User) (*domain.Token, error)
	Logout(user *domain.User) error
	Delete(user *domain.User) error
}
