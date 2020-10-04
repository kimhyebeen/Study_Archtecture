package com.khb.contacts

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.khb.contacts.databinding.ItemContactBinding

class ContactAdapter: RecyclerView.Adapter<ContactAdapter.ItemViewHolder>() {
//    private lateinit var binding: ItemContactBinding
    var items = ArrayList<Contact>().apply { add(Contact("kafka", "010-4242-1235", 'K')) }

    inner class ItemViewHolder(private val itemBinding: ItemContactBinding) : RecyclerView.ViewHolder(itemBinding.root) {

        fun onBind(item: Contact) {
            itemBinding.contact = item
            itemBinding.executePendingBindings()
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        val binding = ItemContactBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return ItemViewHolder(binding)
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) {
        holder.onBind(items[position])
    }

    override fun getItemCount(): Int {
        return items.size
    }

    fun setItem(contacts: ArrayList<Contact>?) {
        contacts?.let {
            this.items = contacts
            notifyDataSetChanged()
        }
    }

    fun addItem(contact: Contact) {
        this.items.add(contact)
        notifyDataSetChanged()
    }
}