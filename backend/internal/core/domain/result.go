package domain

type Result struct {
	GameType string
	GameMode string
	Scores   string `db:"scores"`
	Lvl      int    `db:"lvl"`
	Username string `db:"username"`
}

func NewResult(gameType, gameMode, scores, username string, lvl int) *Result {
	return &Result{
		GameType: gameType,
		GameMode: gameMode,
		Scores:   scores,
		Lvl:      lvl,
		Username: username,
	}
}
