package com.khb.contacts

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "contact")
data class ContactEntity (
    @PrimaryKey(autoGenerate = true)
    var id: Long?,
    var name: String,
    var number: String,
    var initial: Char
) {
    constructor(): this(null, "", "", '\u0000')
}