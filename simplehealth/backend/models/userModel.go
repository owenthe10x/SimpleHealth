package models

import (
	"time"

	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	ID 	 uint
	Email    string `gorm:"unique"`
	Password string
	Name     string
	Disease  []Disease `gorm:"foreignKey:UserID"`
	Activity []Activity `gorm:"foreignKey:UserID"`
	Medicine []Medicine `gorm:"foreignKey:UserID"`
	CreatedAt time.Time
}
