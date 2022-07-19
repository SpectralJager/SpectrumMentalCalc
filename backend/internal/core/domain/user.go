package domain

type User struct {
	Username string `sql:"username"`
	Password string `sql:"password"`
}

func NewUser(username, password string) *User {
	return &User{
		Username: username,
		Password: password,
	}
}

func (s *User) isEqual(user *User) bool {
	if s.Username == user.Username && s.Password == user.Password {
		return true
	}
	return false
}
