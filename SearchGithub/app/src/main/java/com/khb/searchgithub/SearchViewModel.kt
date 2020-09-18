package com.khb.searchgithub

import android.app.Application
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class SearchViewModel(application: Application): AndroidViewModel(application) {
//    private val repository = SearchRepository(application)
    private var name: String = ""
    val users: MutableLiveData<ArrayList<User>> = MutableLiveData()

    fun search() {
//        repository.fetchUsers(name)
//            .subscribe({ users.value = it.items },
//                { Log.e("search api error", it.toString()) })
//            .addTo(compositeDisposable)
    }

    fun onTextChanged(text: CharSequence) {
        this.name = text.toString()
    }

}