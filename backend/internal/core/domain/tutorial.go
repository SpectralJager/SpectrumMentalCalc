package domain

import (
	"time"
)

type Tutorial struct {
	GameType  string    `bson:"game_type"`
	GameMode  string    `bson:"game_mode"`
	Title     string    `bson:"title"`
	Body      string    `bson:"body"`
	Reference []string  `bson:"reference"`
	CreatedAt time.Time `bson:"created_at"`
	UpdatedAt time.Time `bson:"updated_at"`
}

func NewTutorial(gameType, gameMode, title, body string, reference []string, time time.Time) *Tutorial {
	return &Tutorial{
		GameType:  gameType,
		GameMode:  gameMode,
		Title:     title,
		Body:      body,
		Reference: reference,
		CreatedAt: time,
		UpdatedAt: time,
	}
}
