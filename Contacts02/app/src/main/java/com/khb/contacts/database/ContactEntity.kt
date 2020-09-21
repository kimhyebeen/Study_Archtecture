package com.khb.contacts.database

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "contacts")
data class ContactEntity (
    @PrimaryKey(autoGenerate = true)
    var id: Long?,
    var name: String,
    var number: String,
    var initial: Char
) {
    constructor(): this(null, "", "", '\u0000')
}
