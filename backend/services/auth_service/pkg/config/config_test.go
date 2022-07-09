package config_test

import (
	"testing"

	"unknspectrum.tech/mental_calc/auth/pkg/config"
)

func TestGetConfgi(t *testing.T) {
	testFilePath := "test_config.yaml"
	result, err := config.GetConfig(testFilePath)
	if err != nil {
		t.Error("Can't read file")
	}
	for index, item := range result {
		switch index {
		case 0:
			if item != "test" {
				t.Fatalf("Got %v, want \"test\"", item)
			}
		case 1:
			for index, v := range item.([]int) {
				if v != (index + 1) {
					t.Errorf("Got %v, want %v", v, index+1)
				}

			}
		}
	}
}
