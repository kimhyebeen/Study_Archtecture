package com.khb.contacts.database

import androidx.room.Entity
import androidx.room.PrimaryKey


@Entity(tableName = "contact")
data class ContactEntity(
    @PrimaryKey(autoGenerate = true)
    var id: Long?,
    var name: String,
    var number: String,
    var initial: String
) {
    constructor(): this(null, "", "", "")
}