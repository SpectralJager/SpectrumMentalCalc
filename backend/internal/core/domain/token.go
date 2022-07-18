package domain

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"log"
	"time"

	"golang.org/x/crypto/bcrypt"
)

type Token string

func NewToken(str string) *Token {
	bytes := []byte(fmt.Sprintf("%s_%v-%v", str, time.Now(), "secret"))
	hash, err := bcrypt.GenerateFromPassword(bytes, bcrypt.DefaultCost)
	if err != nil {
		log.Fatalf("Can't create token: %v", err)
	}
	hasher := md5.New()
	_, err = hasher.Write(hash)
	if err != nil {
		log.Fatalf("Can't create token: %v", err)
	}
	token := Token(hex.EncodeToString(hasher.Sum(nil)))
	return &token
}
