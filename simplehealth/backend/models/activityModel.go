package models

import (
	"time"

	"gorm.io/gorm"
)

// Activity represents a activity entity.

type Activity struct {
	gorm.Model
	ID uint
	Name string
	Description string
	Startdate time.Time
	Enddate time.Time
	UserID uint
}