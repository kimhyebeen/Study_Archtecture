package com.khb.contacts.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.khb.contacts.database.ContactEntity
import com.khb.contacts.databinding.ItemContactBinding

class ContactAdapter(
    val contactItemClick: (ContactEntity) -> Unit,
    val contactItemLongClick: (ContactEntity) -> Unit,
    private var items: List<ContactEntity>
): RecyclerView.Adapter<ContactAdapter.ItemViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder =
        ItemViewHolder(
            ItemContactBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        )

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

            itemView.setOnClickListener { contactItemClick(item) }
            itemView.setOnLongClickListener {
                contactItemLongClick(item)
                true
            }
        }
    }
}