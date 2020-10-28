package com.khb.doglist.presenter

import android.os.Handler
import com.khb.doglist.base.SearchContract
import com.khb.doglist.model.DogListData

class SearchPresenter: SearchContract.Presenter {
    private var searchView: SearchContract.View? = null

    override fun getDogList() {
        searchView?.showLoading()
        Handler().postDelayed({
            val list = DogListData.getDogListData()
            searchView?.showDogList(list)
            searchView?.hideLoading()
        }, 1000)
    }

    override fun takeView(view: SearchContract.View) {
        searchView = view
    }

    override fun dropView() {
        searchView = null
    }
}