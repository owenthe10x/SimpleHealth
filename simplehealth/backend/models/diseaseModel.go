package models

import "gorm.io/gorm"

// Disease represents a disease entity.
type Disease struct {
	gorm.Model
	Name    string
	Description string
	Startdate string
	Enddate string
	Status bool
	UserID uint
}
