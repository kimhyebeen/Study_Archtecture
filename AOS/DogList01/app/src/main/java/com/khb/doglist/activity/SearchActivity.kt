package com.khb.doglist.activity

import android.annotation.SuppressLint
import android.view.View
import android.widget.ProgressBar
import android.widget.Toast
import androidx.constraintlayout.widget.ConstraintLayout
import com.khb.doglist.R
import com.khb.doglist.base.BaseActivity
import com.khb.doglist.base.SearchContract
import com.khb.doglist.model.Dog
import com.khb.doglist.presenter.SearchPresenter
import kotlinx.android.synthetic.main.activity_search.*

class SearchActivity : BaseActivity(R.layout.activity_search), SearchContract.View {
    private lateinit var searchPresenter: SearchPresenter
    private lateinit var progressBar: ProgressBar

    override fun initPresenter() {
        searchPresenter = SearchPresenter()
        searchPresenter.takeView(this)
    }

    override fun setButton() {
        getDogListButton.setOnClickListener {
            searchPresenter.getDogList()
        }
    }

    override fun showLoading() {
        startProgressBar()
    }

    override fun hideLoading() {
        progressBar.visibility = View.GONE
    }

    @SuppressLint("SetTextI18n")
    override fun showDogList(list: List<Dog>) {
        firstDogText.text = "Name: ${list[0].name}, Age: ${list[0].age}"
        secondDogText.text = "Name: ${list[1].name}, Age: ${list[1].age}"
        thirdDogText.text = "Name: ${list[2].name}, Age: ${list[2].age}"
    }

    override fun showError(error: String) {
        Toast.makeText(this@SearchActivity, error, Toast.LENGTH_SHORT).show()
    }

    private fun startProgressBar() {
        progressBar = ProgressBar(this)

        val params = ConstraintLayout.LayoutParams(150, 150)
        params.apply {
            topToTop = R.id.searchLayout
            bottomToBottom = R.id.searchLayout
            leftToLeft = R.id.searchLayout
            rightToRight = R.id.searchLayout
            searchLayout.addView(progressBar, this)
        }
        progressBar.visibility = View.VISIBLE
    }

    override fun onDestroy() {
        super.onDestroy()
        searchPresenter.dropView()
    }
}