package com.khb.contacts

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.databinding.BaseObservable
import androidx.databinding.Bindable
import androidx.databinding.DataBindingUtil
import com.khb.contacts.databinding.ActivityAddBinding
import com.khb.contacts.databinding.ActivityMainBinding

class AddActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAddBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add)

        binding = DataBindingUtil.setContentView(this, R.layout.activity_add)
        binding.addAct = this@AddActivity

    }
}