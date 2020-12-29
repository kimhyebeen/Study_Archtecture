package com.khb.doglist.model

/**
 * 원래는 시간이 많이 드는 네트워크나 데이터베이스 작업이 구현되어야 하지만,
 * 지금은 흉내만 내기 위한 클래스.
 */
object DogListData {
    fun getDogListData(): List<Dog> {
        return listOf(
            Dog("jjugury", 5),
            Dog("dally", 3),
            Dog("happy", 9)
        )
    }
}