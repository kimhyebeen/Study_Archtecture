package com.khb.doglist.base

interface BasePresenter<T> {
    fun takeView(view: T) // View가 생성 혹은 bind될 때 Presenter에 전달
    fun dropView() // View가 제거되거나 unbind될 때 Presenter에 전달
}