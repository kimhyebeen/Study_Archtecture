package com.khb.contacts

import android.content.Context
import androidx.room.Room
import androidx.room.RoomDatabase

abstract class ContactDatabase: RoomDatabase() {
    abstract fun contactDao(): ContactDao

    companion object {
        private var INSTANCE: ContactDatabase? = null

        fun getInstance(context: Context): ContactDatabase? {
            INSTANCE?.let { return it } ?: return initInstance(context)
        }

        private fun initInstance(context: Context): ContactDatabase? {
            synchronized(ContactDatabase::class) {
                INSTANCE = Room.databaseBuilder(context.applicationContext, ContactDatabase::class.java, "contact")
                    .fallbackToDestructiveMigration() // 데이터베이스가 갱신될 때 기존의 테이블을 버리고 새로 사용
                    .build()
            }
            return INSTANCE
        }
    }
}