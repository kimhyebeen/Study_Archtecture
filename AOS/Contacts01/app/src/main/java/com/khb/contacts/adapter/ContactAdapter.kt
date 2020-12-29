package com.khb.contacts.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.khb.contacts.R
import com.khb.contacts.database.ContactEntity
import kotlinx.android.synthetic.main.item_contact.view.*

class ContactAdapter(
    val contactItemClick: (ContactEntity) -> Unit,
    val contactItemLongClick: (ContactEntity) -> Unit
): RecyclerView.Adapter<ContactAdapter.ItemViewHolder>() {
    private var contacts: List<ContactEntity> = listOf()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_contact, parent, false)

        return ItemViewHolder(view)
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) {
        holder.onBind(contacts[position])
    }

    override fun getItemCount(): Int {
        return contacts.size
    }

    fun setContacts(contacts: List<ContactEntity>) {
        this.contacts = contacts
        notifyDataSetChanged()
    }

    inner class ItemViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
        private val initial = itemView.initialTextView
        private val name = itemView.nameTextView
        private val number = itemView.numberTextView

        fun onBind(contact: ContactEntity) {
            this.initial.text = contact.initial.toString()
            this.name.text = contact.name
            this.number.text = contact.number

            itemView.setOnClickListener {
                contactItemClick(contact)
            }

            itemView.setOnLongClickListener {
                contactItemLongClick(contact)
                true
            }
        }
    }
}