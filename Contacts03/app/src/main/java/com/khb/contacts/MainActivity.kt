package com.khb.contacts

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AlertDialog
import androidx.databinding.BindingAdapter
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.khb.contacts.adapter.ContactAdapter
import com.khb.contacts.database.ContactEntity
import com.khb.contacts.databinding.ActivityMainBinding
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private lateinit var contactViewModel: ContactViewModel
    private lateinit var binding: ActivityMainBinding
    private lateinit var contactAdapter: ContactAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
        binding.main = this@MainActivity

        contactAdapter = ContactAdapter(
            { contact -> updateDialog(contact) },
            { contact -> deleteDialog(contact) },
            mutableListOf()
        )
        /**
         * hasFixedSize를 true로 해주지 않으면,
         * 항목의 크기가 변경되어 비용이 많이 드는 작업을 하는지 확인한다.
         * 이런 불필요한 과정을 피하기 위해서 true로 해준다.
         */
        binding.contactRecyclerView.apply {
            adapter = contactAdapter
            layoutManager = LinearLayoutManager(applicationContext)
            setHasFixedSize(true)
        }
        /**
         * 뷰모델 객체는 직접적으로 초기화 해주는 것이 아니라, 안드로이드 시스템을 통해 생성해준다.
         * 시스템에서는 만약 이미 생성된 ViewModel 인스턴스가 있다면 이를 반환할 것이므로 메모리 낭비를 줄여준다.
         * 따라서 ViewModelProviders를 이용해 get 해준다.
         */
        contactViewModel = ViewModelProviders.of(this).get(ContactViewModel::class.java)
        contactViewModel.getAll().observe(this, {
            contactAdapter.setContents(it)
        })
    }

    fun startAddActivity(view: View) {
        startActivity(Intent(this, AddActivity::class.java))
    }

    private fun updateDialog(contact: ContactEntity) {
        Intent(this, AddActivity::class.java).let {
            it.putExtra(AddActivity.EXTRA_CONTACT_NAME, contact.name)
            it.putExtra(AddActivity.EXTRA_CONTACT_NUMBER, contact.number)
            it.putExtra(AddActivity.EXTRA_CONTACT_ID, contact.id)
            startActivity(it)
        }
    }

    private fun deleteDialog(contact: ContactEntity) {
        val builder = AlertDialog.Builder(this)
        builder.setMessage("Delete selected contact?")
            .setNegativeButton("NO") { _, _ -> }
            .setPositiveButton("YES") { _, _ -> contactViewModel.delete(contact) }
        builder.show()
    }
}