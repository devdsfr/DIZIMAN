package models

import "time"

type Member struct {
	ID               uint      `json:"id" gorm:"primary_key"`
	Name             string    `json:"name"`
	Login            string    `json:"login"`
	Address          string    `json:"address"`
	BirthDate        time.Time `json:"birthDate"`
	City             string    `json:"city"`
	State            string    `json:"state"`
	ZipCode          string    `json:"zipCode"`
	Gender           string    `json:"gender"`
	Profile          string    `json:"profile"`
	RegistrationDate time.Time `json:"registrationDate"`
}
