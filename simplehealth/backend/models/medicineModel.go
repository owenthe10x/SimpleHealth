package models

import (
	"time"

	"gorm.io/gorm"
)

// Medicine represents a medicine entity.
type Medicine struct {
	gorm.Model
	ID uint
	Name string
	Description string
	Quantity int
	Consumetime time.Time
	UserID uint
}