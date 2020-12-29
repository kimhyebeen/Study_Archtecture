package com.khb.doglist.base

import com.khb.doglist.model.Dog

// TODO("왜? 왜 Contract로 각 기능을 정의하지?? 그냥 interface로 각각 하는 게 아니라???")
interface SearchContract { // View와 Presenter가 구현해야 할 인터페이스 정의
    interface View: BaseView {
        fun showLoading() // 데이터를 받아 가공할 동안 보여질 progress bar 관리
        fun hideLoading()
        fun showDogList(list: List<Dog>) // 가공한 데이터를 Presenter 로부터 전달받아요.
    }

    interface Presenter: BasePresenter<View> {
        fun getDogList() // Model 로부터 데이터를 받아오기 위한 함수 (가공되지 않은)
    }
}