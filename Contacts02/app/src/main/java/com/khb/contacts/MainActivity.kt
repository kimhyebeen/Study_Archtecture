package com.khb.contacts

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.databinding.DataBindingUtil
import androidx.databinding.ObservableArrayList
import com.khb.contacts.database.ContactEntity
import com.khb.contacts.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    lateinit var binding: ActivityMainBinding
    private var contactAdapter = ContactAdapter()
    private var contactList = ArrayList<Contact>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
        binding.main = this@MainActivity
        binding.contactRecyclerView.adapter = contactAdapter
        contactList.add(Contact("asdf", "010-1234-1234", 'A'))
        contactAdapter.setItem(contactList)
        binding.contactList = contactList
    }
    fun startAddPage(view: View) {
        startActivity(Intent(this, AddActivity::class.java))
    }
}