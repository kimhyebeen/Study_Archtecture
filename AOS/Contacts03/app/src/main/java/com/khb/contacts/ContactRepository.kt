package com.khb.contacts

import android.annotation.SuppressLint
import android.app.Application
import androidx.lifecycle.LiveData
import com.khb.contacts.database.ContactDatabase
import com.khb.contacts.database.ContactEntity
import io.reactivex.Completable
import io.reactivex.Single
import io.reactivex.schedulers.Schedulers

class ContactRepository(application: Application) {
    private val contactDatabase = ContactDatabase.getInstance(application)!!
    private val contactDao = contactDatabase.contactDao()
    private lateinit var contacts: LiveData<List<ContactEntity>>

    @SuppressLint("CheckResult")
    fun getAll(): LiveData<List<ContactEntity>> {
        Single.just(contactDao.getAll())
            .subscribe(
                { contacts = it },
                { println("onError") }
            )
        return contacts
    }

    @SuppressLint("CheckResult")
    fun insert(contact: ContactEntity) {
        Completable.complete()
            .subscribeOn(Schedulers.io())
            .subscribe(
                { contactDao.insert(contact) },
                { println("repository : onError") }
            )
    }

    @SuppressLint("CheckResult")
    fun delete(contact: ContactEntity) {
        Completable.complete()
            .subscribeOn(Schedulers.io())
            .subscribe(
                { contactDao.delete(contact) },
                { println("repository : onError") }
            )
    }
}