package com.khb.contacts.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.khb.contacts.database.ContactEntity
import com.khb.contacts.databinding.ItemContactBinding

class ContactAdapter(
    // 아이템을 클릭했을 때, AddActivity가 띄워지면서 데이터 수정이 가능하도록 하는 함수를 넘겨받습니다.
    val contactItemClick: (ContactEntity) -> Unit,
    // 아이템을 길게 클릭했을 때, 데이터를 삭제할 건지 여부를 묻는 dialog가 띄워지도록 하는 함수를 넘겨받습니다.
    val contactItemLongClick: (ContactEntity) -> Unit,
    // recycler view에 보여질 아이템 리스트입니다.
    private var items: List<ContactEntity>
): RecyclerView.Adapter<ContactAdapter.ItemViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        LayoutInflater.from(parent.context).let {
            val binding = ItemContactBinding.inflate(it, parent, false)
            return ItemViewHolder(binding)
        }
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) = holder.onBind(items[position])

    override fun getItemCount(): Int = items.size

    fun setContents(data: List<ContactEntity>) {
        items = data
        notifyDataSetChanged()
    }

    inner class ItemViewHolder(
        private var itemBinding: ItemContactBinding
    ): RecyclerView.ViewHolder(itemBinding.root) {

        fun onBind(item: ContactEntity) {
            itemBinding.contact = item

            // 아이템을 길게 클릭했을 때와, 그냥 클릭했을 때의 이벤트를 설정해줍니다.
            itemView.setOnClickListener { contactItemClick(item) }
            itemView.setOnLongClickListener {
                contactItemLongClick(item)
                true
            }
        }
    }
}

