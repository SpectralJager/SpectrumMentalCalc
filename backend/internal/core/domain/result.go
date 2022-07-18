package domain

type Result struct {
	gameType string
	gameMode string
	scores   string `sql:"scores"`
	lvl      int    `sql:"lvl"`
	username string `sql:"username"`
}

func NewResult(gameType, gameMode, scores, username string, lvl int) *Result {
	return &Result{
		gameType: gameType,
		gameMode: gameMode,
		scores:   scores,
		lvl:      lvl,
		username: username,
	}
}

func (s *Result) UpdateResult(scores string, lvl int) {
	s.scores = scores
	s.lvl = lvl
}

func (s *Result) getGameType() string {
	return s.gameType
}

func (s *Result) getGameMode() string {
	return s.gameMode
}

func (s *Result) getScores() string {
	return s.scores
}

func (s *Result) getLvl() int {
	return s.lvl
}

func (s *Result) getUsername() string {
	return s.username
}
