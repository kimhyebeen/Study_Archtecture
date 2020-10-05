package com.khb.contacts

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.ViewModelProviders
import com.khb.contacts.database.ContactEntity
import com.khb.contacts.databinding.ActivityAddBinding
import kotlinx.android.synthetic.main.activity_add.*

class AddActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAddBinding
    private lateinit var contactViewModel: ContactViewModel
    private var id: Long? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_add)
        binding.addAct = this@AddActivity

        contactViewModel = ViewModelProviders.of(this).get(ContactViewModel::class.java)

        intent?.let {
            if (it.hasExtra(EXTRA_CONTACT_NAME) && it.hasExtra(EXTRA_CONTACT_NUMBER) && it.hasExtra(EXTRA_CONTACT_ID)) {
                binding.nameEditText.setText(it.getStringExtra(EXTRA_CONTACT_NAME))
                binding.numberEditText.setText(it.getStringExtra(EXTRA_CONTACT_NUMBER))
                id = it.getLongExtra(EXTRA_CONTACT_ID, -1)
            }
        }
    }

    fun saveInformation(view: View) {
        val name = nameEditText.text.toString().trim()
        val number = numberEditText.text.toString()

        if (name.isEmpty() || number.isEmpty()) {
            Toast.makeText(this, "Please enter name and number.", Toast.LENGTH_SHORT).show()
        } else {
            val initial = name[0].toUpperCase().toString()
            val contact = ContactEntity(id, name, number, initial)
            contactViewModel.insert(contact)
            finish()
        }
    }

    companion object {
        const val EXTRA_CONTACT_NAME = "EXTRA_CONTACT_NAME"
        const val EXTRA_CONTACT_NUMBER = "EXTRA_CONTACT_NUMBER"
        const val EXTRA_CONTACT_ID = "EXTRA_CONTACT_ID"
    }
}