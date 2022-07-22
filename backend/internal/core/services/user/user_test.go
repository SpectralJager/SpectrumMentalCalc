package user_service_test

import (
	"smct/backend/internal/core/domain"
	user_service "smct/backend/internal/core/services/user"
	user_repository "smct/backend/internal/repositories/user"
	"testing"
)

var (
	userService *user_service.UserService
)

func init() {
	userPGRep, _ := user_repository.NewUserRepository("spectrum", "238516", "localhost", "mental_calc_user")
	userService = user_service.NewUserService(userPGRep)
}

func TestCreate(t *testing.T) {
	testCases := []struct {
		desc  string
		input map[string]string
		want  *domain.User
	}{
		{
			desc:  "Create 'Test1' user",
			input: map[string]string{"username": "Test1", "password": "test123"},
			want:  &domain.User{Username: "Test1", Password: "test123"},
		},
		{
			desc:  "Create 'Test2' user",
			input: map[string]string{"username": "Test2", "password": "test123"},
			want:  &domain.User{Username: "Test2", Password: "test123"},
		},
	}
	for _, tC := range testCases {
		t.Run(tC.desc, func(t *testing.T) {
			got, err := userService.Create(tC.input["username"], tC.input["password"])
			if err != nil {
				t.Fatalf("cant create user: %v", err)
			}
			if !tC.want.IsEqual(got) {
				t.Fatal("not equeal users")
			}

		})
	}
}

func TestGet(t *testing.T) {
	testCases := []struct {
		desc  string
		input map[string]string
		want  *domain.User
	}{
		{
			desc:  "Get 'Test' user",
			input: map[string]string{"username": "Test"},
			want:  &domain.User{Username: "Test1", Password: "test123"},
		},
		{
			desc:  "Get 'Test2' user",
			input: map[string]string{"username": "Test2"},
			want:  &domain.User{Username: "Test2", Password: "test123"},
		},
	}
	for _, tC := range testCases {
		t.Run(tC.desc, func(t *testing.T) {
			got, err := userService.Get(tC.input["username"])
			if err != nil {
				t.Fatalf("cant get user: %v", err)
			}
			if tC.want.IsEqual(got) {
				t.Fatal("not equeal users")
			}

		})
	}
}

func TestUpdate(t *testing.T) {
	testCases := []struct {
		desc string
		new  *domain.User
		old  *domain.User
	}{
		{
			desc: "update 'test' user",
			old: &domain.User{
				Username: "Test1",
				Password: "test123",
			},
			new: &domain.User{
				Username: "test1",
				Password: "123",
			},
		},
	}
	for _, tC := range testCases {
		t.Run(tC.desc, func(t *testing.T) {
			err := userService.Update(tC.new, tC.old)
			if err != nil {
				t.Fatalf("cant update user: %v", err)
			}

		})
	}
}

func TestDelete(t *testing.T) {
	testCases := []struct {
		desc  string
		input *domain.User
	}{
		{
			desc:  "Delete 'Test1' user",
			input: &domain.User{Username: "test1", Password: "123"},
		},
		{
			desc:  "Delete 'Test2' user",
			input: &domain.User{Username: "Test2", Password: "test123"},
		},
	}
	for _, tC := range testCases {
		t.Run(tC.desc, func(t *testing.T) {
			err := userService.Delete(tC.input)
			if err != nil {
				t.Fatalf("cant delete user: %v", err)
			}

		})
	}
}
