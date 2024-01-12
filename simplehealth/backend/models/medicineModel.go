package models

import (
	"time"

	"gorm.io/gorm"
)

// Medicine represents a medicine entity.
type Medicine struct {
	gorm.Model
	ID uint `gorm:"primaryKey"`
	Name string 
	Description string 
	Quantity int `gorm:"type:int"`
	Consumetime time.Time `gorm:"type:time"`
	UserID uint `gorm:"foreignKey:UserID"`
}