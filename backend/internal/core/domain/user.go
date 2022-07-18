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
