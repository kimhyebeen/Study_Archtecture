package com.khb.contacts

import androidx.databinding.BaseObservable
import androidx.databinding.Bindable

class Model: BaseObservable() {

    @get:Bindable
    var name: String = ""
    set(value) {
        field = value
        notifyPropertyChanged(BR.name)
    }

    @get:Bindable
    var enable: Boolean = false
    set(value) {
        field = value
        notifyPropertyChanged(BR.enable)
    }

    @get:Bindable
    var check: Boolean = name == ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.check)
        }
}