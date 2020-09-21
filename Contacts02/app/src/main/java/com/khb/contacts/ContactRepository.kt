package com.khb.contacts

import android.app.Application
import androidx.lifecycle.LiveData
import com.khb.contacts.database.ContactDatabase
import com.khb.contacts.database.ContactEntity
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class ContactRepository(application: Application) {
    private val contactDatabase = ContactDatabase.getInstance(application)!!
    private val contactDao = contactDatabase.contactDao()
    private val contacts = contactDao.getAll()

    fun getAll(): LiveData<List<ContactEntity>> {
        return contacts
    }

    fun insert(contact: ContactEntity) {
        GlobalScope.launch(Dispatchers.IO) { contactDao.insert(contact) }
    }

    fun delete(contact: ContactEntity) {
        GlobalScope.launch(Dispatchers.IO) { contactDao.delete(contact) }
    }
}
