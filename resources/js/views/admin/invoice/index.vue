<template>
  <index-page>
    <template v-slot:search-field>
      <v-select-container title="Select Account Head" field="search_data.account_head_id" col="3">
        <v-select v-model="search_data.account_head_id" label="title" :reduce="(obj) => obj.id"
          :options="$root.global.account_heads" placeholder="--Select Account Head--" :closeOnSelect="true"></v-select>
      </v-select-container>
      <v-select-container title="Payment Status" field="search_data.payment_status" col="3">
        <v-select v-model="search_data.payment_status" label="name" :reduce="(obj) => obj.value"
          :options="$root.global.payemnt_status" placeholder="--Select Payment Status--"
          :closeOnSelect="true"></v-select>
      </v-select-container>
      <date-picker id='searchfrominvoicedate' v-model='search_data.from_invoice_date'
        field='search_data.from_invoice_date' title='From Invoice Date' placeholder='From Invoice Date' col='3'
        :req='false'></date-picker>
      <date-picker id='searchtoinvoicedate' v-model='search_data.to_invoice_date' field='search_data.to_invoice_date'
        title='To Invoice Date' placeholder='To Invoice Date' col='3' :req='false'
        :disablePastDates="search_data.from_invoice_date"></date-picker>
      <date-picker id='searchfrompaymentedate' v-model='search_data.from_payment_date'
        field='search_data.from_payment_date' title='From Payment Date' placeholder='From Payment Date' col='3'
        :req='false'></date-picker>
      <date-picker id='searchtopaymentedate' v-model='search_data.to_payment_date' field='search_data.to_payment_date'
        title='To Payment Date' placeholder='To Payment Date' col='3' :req='false'></date-picker>
    </template>
  </index-page>
</template>

<script>

const model = "invoice";

const tableColumns = [
  { field: "organization_id", title: "Organization", subfield: "Organization.Organization_name", enable_data_sorting: false, },
  { field: "invoice_no", title: "Invoice No" },
  { field: "invoice_date", title: "Invoice Date" },
  { field: "amount", title: "Amount" },
  { field: "paid_amount", title: "Paid Amount" },
  { field: "payment_date", title: "Payment Date" },
  { field: "trxid", title: "Trxid" },
  { field: "payment_status", title: "Payment Status" },
  { field: "status", title: "Status", align: "center" },
];

const json_fields = {
  "Organization": "organization_id",
  "Invoice No": "invoice_no",
  "Invoice Date": "invoice_date",
  "Amount": "amount",
  "Paid Amount": "paid_amount",
  "Payment Date": "payment_date",
  "Trxid": "trxid",
  "Payment Status": "payment_status",
};

export default {

  data() {
    return {
      model: model,
      page_title: "",
      json_fields: json_fields,
      fields_name: {
        default: "Select One",
        invoice_no: "Invoice No",
        trxid: 'Trx ID',
        card_type: 'Card Type'
      },
      search_data: {
        account_head_id: "",
        payment_status: "",
        from_invoice_date: "",
        to_invoice_date: "",
        from_payment_date: "",
        to_payment_date: "",
        pagination: this.$route.query.pagination ?? 10,
        page: this.$route.query.page ?? 1,
        field_name: this.$route.query.field_name ?? "",
        value: this.$route.query.value ?? "",
        status: this.$route.query.status ?? "",
      },
      minToDate: null,
      table: {
        columns: tableColumns,
        routes: {
          array: [
            {
              title: "Invoice",
              route: "invoice.bill",
              content: `<span class="icon"> <i class="fa fa-clipboard-list"></i></span> `,
              params: [
                {
                  name: "id",
                  field: "id",
                },
              ],
            },
            {
              title: "Money Receipt",
              route: "invoice.moneyreceipt",
              content: `<span class="icon"> <i class="fa fa-money-bill-alt"></i></span> `,
              params: [
                {
                  name: "id",
                  field: "id",
                },
              ],
            },
          ],
        },

        datas: [],
        meta: [],
        links: []
      }
    };
  },

  provide() {
    return {
      validate: this.validation,
      model: this.model,
      fields_name: this.fields_name,
      search_data: this.search_data,
      table: this.table,
      json_fields: this.json_fields,
      search: this.search,
      resetSearchData: this.resetSearchData,
    };
  },

  methods: {
    updateToDateMin(date) {
      console.log(date);
      this.minToDate = date; // যখন from date select হবে → to date এর জন্য minDate সেট হবে
      if (this.search_data.to_invoice_date && this.search_data.to_invoice_date < date) {
        this.search_data.to_invoice_date = ""; // যদি আগে থেকে ছোট date select করা থাকে → clear করে দেবে
      }
    },
    search() {
      this.get_paginate(this.model, this.search_data);
    },

    resetSearchData() {
      this.search_data.pagination = 10;
      this.search_data.page = 1;
      this.search_data.field_name = "";
      this.search_data.value = "";
      this.search_data.status = "";
    },
  },

  created() {
    this.getRouteName(this.model);
    this.page_title = `${this.headline(this.model)} List`;
    this.search();
  },

  validators: {},
};
</script>