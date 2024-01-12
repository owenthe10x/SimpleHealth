package models

import (
	"time"

	"gorm.io/gorm"
)

type Doctor struct {
	gorm.Model
	ID       uint
	Email    string `gorm:"unique"`
	Password string
	Name     string
	Specialization string
	Customernum int64
	Rating float64
	CreatedAt time.Time
}
