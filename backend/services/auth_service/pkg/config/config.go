package config

import (
	"io/ioutil"
	"log"

	"gopkg.in/yaml.v3"
)

func GetConfig(filePath string) (config map[interface{}]interface{}, err error) {
	yfile, err := ioutil.ReadFile(filePath)
	if err != nil {
		log.Printf("Can't read file: \n %v", err)
		return
	}
	err = yaml.Unmarshal(yfile, &config)
	if err != nil {
		log.Printf("Can't decode file:\n %v", err)
		return
	}
	return
}
