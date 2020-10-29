package com.khb.doglist.base

import android.os.Bundle
import android.os.PersistableBundle
import androidx.appcompat.app.AppCompatActivity

abstract class BaseActivity(
    private val layoutId: Int
): AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(layoutId)

        initPresenter() // View와 상호작용할 Presenter를 주입하기 위해
        setButton()
    }

    abstract fun initPresenter()

    abstract fun setButton()
}